import 'customer_orm.dart';
import '../proto_generated/customer.pb.dart';
import '../proto_generated/customer.pbgrpc.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:static_grpc/static_grpc.dart';

class CustomerService extends CustomerServiceBase {
  final PostgreSQLConnection pgConnection;
  CustomerService(this.pgConnection) : super();

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
    case SelectableColumns.customerId:
      columns.customer_id;
      break;
    case SelectableColumns.storeId:
      columns.store_id;
      break;
    case SelectableColumns.firstName:
      columns.first_name;
      break;
    case SelectableColumns.lastName:
      columns.last_name;
      break;
    case SelectableColumns.email:
      columns.email;
      break;
    case SelectableColumns.addressId:
      columns.address_id;
      break;
    case SelectableColumns.activebool:
      columns.activebool;
      break;
    case SelectableColumns.createDate:
      columns.create_date;
      break;
    case SelectableColumns.lastUpdate:
      columns.last_update;
      break;
    case SelectableColumns.active:
      columns.active;
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
  var customerOrm = Customer_ORM(newConnection(connection));

  return (await customerOrm.materializeFromProto3Json(proto3Json)).fold((l) {
    return GetResponse()
      ..result = false
      ..errorMessage = l.toJson();
  }, (r) {
    return GetResponse()
      ..result = true
      ..mergeFromProto3Json(customerOrm.recordToProto3Json());
  });
}

Future<InsertResponse> executeInsert(List<CustomerToInsert> data,
    bool inTransaction, PostgreSQLConnection connection) async {
  var response = InsertResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
        response.errorMessage.addAll(await performAllInserts(
            data, Customer_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllInserts(
          data, Customer_ORM(newConnection(pgconnection)), inTransaction));
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
    List<CustomerToInsert> data, Customer_ORM orm, bool inTransaction) async {
  var result = <String>[];
  for (var customer in data) {
    var error = (await tryToInsert(
        orm, customer.toProto3Json() as Map<String, dynamic>));
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
    Customer_ORM orm, Map<String, dynamic> data) async {
  try {
    var result = <String>[];
    (await orm.insertFromProto3Json(data))
        .leftMap((l) => result.add(l.toJson()));
    return result;
  } catch (e) {
    return [e.toString()];
  }
}

Future<UpdateResponse> executeUpdate(List<Customer> data,
    bool inTransaction, PostgreSQLConnection connection) async {
  var response = UpdateResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
        response.errorMessage.addAll(await performAllUpdates(
            data, Customer_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllUpdates(
          data, Customer_ORM(newConnection(pgconnection)), inTransaction));
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
    List<Customer> data, Customer_ORM orm, bool inTransaction) async {
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
    Customer_ORM orm, Map<String, dynamic> data) async {
  try {
    var result = <String>[];
    (await orm.updateFromProto3Json(data))
        .leftMap((l) => result.add(l.toJson()));
    return result;
  } catch (e) {
    return [e.toString()];
  }
}

Future<DeleteResponse> executeDelete(List<CustomerPk> pkData,
    bool inTransaction, PostgreSQLConnection connection) async {
  var response = DeleteResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
      response.errorMessage.addAll(await performAllDeletes(
          pkData, Customer_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllDeletes(
          pkData, Customer_ORM(newConnection(pgconnection)), inTransaction));
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
    List<CustomerPk> pkData, Customer_ORM orm, bool inTransaction) async {
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
    Customer_ORM orm, Map<String, dynamic> data) async {
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
  var ds = ((await Customer_ORM(connection).select(
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
      case SelectableColumns.customerId:
        name = 'customer_id';
        break;
      case SelectableColumns.storeId:
        name = 'store_id';
        break;
      case SelectableColumns.firstName:
        name = 'first_name';
        break;
      case SelectableColumns.lastName:
        name = 'last_name';
        break;
      case SelectableColumns.email:
        name = 'email';
        break;
      case SelectableColumns.addressId:
        name = 'address_id';
        break;
      case SelectableColumns.activebool:
        name = 'activebool';
        break;
      case SelectableColumns.createDate:
        name = 'create_date';
        break;
      case SelectableColumns.lastUpdate:
        name = 'last_update';
        break;
      case SelectableColumns.active:
        name = 'active';
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
