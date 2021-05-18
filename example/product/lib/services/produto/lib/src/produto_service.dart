import 'produto_orm.dart';
import '../proto_generated/produto.pb.dart';
import '../proto_generated/produto.pbgrpc.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:static_grpc/static_grpc.dart';

class ProdutoService extends ProdutoServiceBase {
  final PostgreSQLConnection pgConnection;
  ProdutoService(this.pgConnection) : super();

  @override
  Future<GetResponse> get(grpc.ServiceCall call, GetRequest request) async {
    return await executeGet(request, pgConnection);
  }

  @override
  Future<InsertResponse> insert(
      grpc.ServiceCall call, InsertRequest request) async {
    return await executeInsert(
        request.data, request.options.inTransaction, pgConnection);
  }

  @override
  Future<UpdateResponse> update(
      grpc.ServiceCall call, UpdateRequest request) async {
    return await executeUpdate(
        request.data, request.options.inTransaction, pgConnection);
  }

  @override
  Future<DeleteResponse> delete(
      grpc.ServiceCall call, DeleteRequest request) async {
    return await executeDelete(
        request.data, request.options.inTransaction, pgConnection);
  }

  @override
  Future<SelectResponse> select(
      grpc.ServiceCall call, SelectRequest request) async {
    return tryToSelect(request, newConnection(pgConnection));
  }
}

Columns getColumnsToSelect(List<SelectableColumns> cols) {
  var result = Columns();
  cols.forEach((element) {
    resolveColumns(result, element);
  });
  return result;
}

void resolveColumns(Columns columns, SelectableColumns column) {
  switch (column) {
    case SelectableColumns.id:
      columns.id;
      break;
    case SelectableColumns.code:
      columns.code;
      break;
    case SelectableColumns.description:
      columns.description;
      break;
    case SelectableColumns.isActive:
      columns.is_active;
      break;
    case SelectableColumns.price:
      columns.price;
      break;
    case SelectableColumns.fullDescription:
      columns.full_description;
      break;
    case SelectableColumns.insertDate:
      columns.insert_date;
      break;
    case SelectableColumns.updateDate:
      columns.update_date;
      break;
  }
}

Future<GetResponse> executeGet(
    GetRequest request, PostgreSQLConnection connection) async {
  return proto3JsonToJsonMap(request.toProto3Json()).fold((error) {
    return GetResponse()..errorMessage = error;
  }, (proto3Json) async {
    return await tryToMaterialize(proto3Json, connection);
  });
}

Future<GetResponse> tryToMaterialize(
    Map<String, dynamic> proto3Json, PostgreSQLConnection connection) async {
  var produtoOrm = Produto_ORM(newConnection(connection));

  return (await produtoOrm.materializeFromProto3Json(proto3Json)).fold((l) {
    return GetResponse()
      ..result = false
      ..errorMessage = l.toJson();
  }, (r) {
    return GetResponse()
      ..result = true
      ..mergeFromProto3Json(produtoOrm.recordToProto3Json());
  });
}

Future<InsertResponse> executeInsert(List<ProdutoToInsert> data,
    bool inTransaction, PostgreSQLConnection connection) async {
  var response = InsertResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
        response.errorMessage.addAll(await performAllInserts(
            data, Produto_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllInserts(
          data, Produto_ORM(newConnection(pgconnection)), inTransaction));
    }

    nextCompleter.complete();
  } catch (e) {
    response.errorMessage.add(e.toString());
    nextCompleter.complete();
  } finally {
    if (!pgconnection.isClosed) await pgconnection.close();
  }

  await nextCompleter.future;
  finalizeInsertResponse(response, data.length, inTransaction);
  return response;
}

void finalizeInsertResponse(
    InsertResponse response, int rowsToInsert, bool inTransaction) {
  if (rowsToInsert <= 0) {
    response.errorMessage.add('No record to insert');
    response.rowsInserted = 0;
  } else {
    if (inTransaction && response.errorMessage.isNotEmpty) {
      response.rowsInserted = 0;
    } else {
      response.rowsInserted = rowsToInsert - response.errorMessage.length;
    }
  }
  response.result = response.errorMessage.isEmpty;
  response.rowsToInsert = rowsToInsert;
}

Future<List<String>> performAllInserts(
    List<ProdutoToInsert> data, Produto_ORM orm, bool inTransaction) async {
  var result = <String>[];
  for (var produto in data) {
    var error = (await tryToInsert(
        orm, produto.toProto3Json() as Map<String, dynamic>));
    if (error.isNotEmpty) {
      result.addAll(error);
      if (inTransaction) {
        break;
      }
    }
  }
  return result;
}

Future<List<String>> tryToInsert(
    Produto_ORM orm, Map<String, dynamic> data) async {
  try {
    var result = <String>[];
    (await orm.insertFromProto3Json(data))
        .leftMap((l) => result.add(l.toJson()));
    return result;
  } catch (e) {
    return [e.toString()];
  }
}

Future<UpdateResponse> executeUpdate(List<Produto> data, bool inTransaction,
    PostgreSQLConnection connection) async {
  var response = UpdateResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
        response.errorMessage.addAll(await performAllUpdates(
            data, Produto_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllUpdates(
          data, Produto_ORM(newConnection(pgconnection)), inTransaction));
    }

    nextCompleter.complete();
  } catch (e) {
    response.errorMessage.add(e.toString());
    nextCompleter.complete();
  } finally {
    if (!pgconnection.isClosed) await pgconnection.close();
  }

  await nextCompleter.future;
  finalizeUpdateResponse(response, data.length, inTransaction);
  return response;
}

void finalizeUpdateResponse(
    UpdateResponse response, int rowsToUpdate, bool inTransaction) {
  if (rowsToUpdate <= 0) {
    response.errorMessage.add('No record to update');
    response.rowsToUpdate = 0;
  } else {
    if (inTransaction && response.errorMessage.isNotEmpty) {
      response.rowsToUpdate = 0;
    } else {
      response.rowsUpdated = rowsToUpdate - response.errorMessage.length;
    }
  }
  response.result = response.errorMessage.isEmpty;
  response.rowsToUpdate = rowsToUpdate;
}

Future<List<String>> performAllUpdates(
    List<Produto> data, Produto_ORM orm, bool inTransaction) async {
  var result = <String>[];
  for (var record in data) {
    var error =
        (await tryToUpdate(orm, record.toProto3Json() as Map<String, dynamic>));

    if (error.isNotEmpty) {
      result.addAll(error);
      if (inTransaction) {
        break;
      }
    }
  }
  return result;
}

Future<List<String>> tryToUpdate(
    Produto_ORM orm, Map<String, dynamic> data) async {
  try {
    var result = <String>[];
    (await orm.updateFromProto3Json(data))
        .leftMap((l) => result.add(l.toJson()));
    return result;
  } catch (e) {
    return [e.toString()];
  }
}

Future<DeleteResponse> executeDelete(List<ProdutoPk> pkData, bool inTransaction,
    PostgreSQLConnection connection) async {
  var response = DeleteResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
        response.errorMessage.addAll(await performAllDeletes(
            pkData, Produto_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllDeletes(
          pkData, Produto_ORM(newConnection(pgconnection)), inTransaction));
    }

    nextCompleter.complete();
  } catch (e) {
    response.errorMessage.add(e.toString());
    nextCompleter.complete();
  } finally {
    if (!pgconnection.isClosed) await pgconnection.close();
  }

  await nextCompleter.future;
  finalizeDeleteResponse(response, pkData.length, inTransaction);
  return response;
}

void finalizeDeleteResponse(
    DeleteResponse response, int rowsToDelete, bool inTransaction) {
  if (rowsToDelete <= 0) {
    response.errorMessage.add('No record to delete');
    response.rowsToDelete = 0;
  } else {
    if (inTransaction && response.errorMessage.isNotEmpty) {
      response.rowsToDelete = 0;
    } else {
      response.rowsDeleted = rowsToDelete - response.errorMessage.length;
    }
  }
  response.result = response.errorMessage.isEmpty;
  response.rowsToDelete = rowsToDelete;
}

Future<List<String>> performAllDeletes(
    List<ProdutoPk> pkData, Produto_ORM orm, bool inTransaction) async {
  var result = <String>[];
  for (var record in pkData) {
    var error =
        (await tryToDelete(orm, record.toProto3Json() as Map<String, dynamic>));

    if (error.isNotEmpty) {
      result.addAll(error);
      if (inTransaction) {
        break;
      }
    }
  }
  return result;
}

Future<List<String>> tryToDelete(
    Produto_ORM orm, Map<String, dynamic> data) async {
  try {
    var result = <String>[];
    (await orm.deleteFromProto3Json(data))
        .leftMap((l) => result.add(l.toJson()));
    return result;
  } catch (e) {
    return [e.toString()];
  }
}

Future<SelectResponse> tryToSelect(
    SelectRequest request, Postgres_SqlConnection connection) async {
  var response = SelectResponse();
  var where = Where();
  var limit = 20;
  var offset = 0;

  if (request.hasWhere()) {
    where.loadFromJson(request.where);
  }
  if (request.hasLimit()) {
    limit = request.limit;
  }
  if (request.hasOffset()) {
    offset = request.offset;
  }
  if (request.hasWhere()) {
    where.loadFromJson(request.where);
  }
  var ds = ((await Produto_ORM(connection).select(
          columns: getColumnsToSelect(request.columns),
          where: where,
          orderBy: getOrderBy(request.orderBy),
          limit: limit,
          offset: offset))
      .toProto3Json());
  response.mergeFromProto3Json(ds);

  response.limit = limit;
  response.offset = offset;
  assignNextPage(response);
  return response;
}

void assignNextPage(SelectResponse response) {
  if (response.totalRowsCount > 0) {
    int totalPages;
    totalPages = response.totalRowsCount ~/ response.limit;
    if ((response.totalRowsCount % response.limit) > 0) {
      totalPages++;
    }
    if ((totalPages - 1) > response.offset) {
      response.nextOffset = response.offset + 1;
    }
  }
}

OrderBy getOrderBy(List<OrderByOperator> operators) {
  var result = OrderBy();
  operators.forEach((element) {
    if (element.column != SelectableColumns.allColumns) {
      result.add(element.toOrdenator());
    }
  });
  return result;
}

extension OrderByColumn on OrderByOperator {
  ColumnOrdenator toOrdenator() {
    var name = '';
    switch (column) {
      case SelectableColumns.id:
        name = 'id';
        break;
      case SelectableColumns.code:
        name = 'code';
        break;
      case SelectableColumns.description:
        name = 'description';
        break;
      case SelectableColumns.isActive:
        name = 'is_active';
        break;
      case SelectableColumns.price:
        name = 'price';
        break;
      case SelectableColumns.fullDescription:
        name = 'full_description';
        break;
      case SelectableColumns.insertDate:
        name = 'insert_date';
        break;
      case SelectableColumns.updateDate:
        name = 'update_date';
        break;
    }
    OrdType ordType;
    if (orderType == OrderType.desc) {
      ordType = OrdType.desc;
    } else {
      ordType = OrdType.asc;
    }
    return ColumnOrdenator(name, ordType);
  }
}
