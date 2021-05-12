import 'film_actor_orm.dart';
import '../proto_generated/film_actor.pb.dart';
import '../proto_generated/film_actor.pbgrpc.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:static_postgres_orm/static_postgres_orm.dart';
import 'dart:async';
import 'package:postgres/postgres.dart';
import 'package:static_grpc/static_grpc.dart';

class Film_actorService extends Film_actorServiceBase {
  final PostgreSQLConnection pgConnection;
  Film_actorService(this.pgConnection) : super();

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
    case SelectableColumns.actorId:
      columns.actor_id;
      break;
    case SelectableColumns.filmId:
      columns.film_id;
      break;
    case SelectableColumns.lastUpdate:
      columns.last_update;
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
  var filmActorOrm = Film_actor_ORM(newConnection(connection));

  return (await filmActorOrm.materializeFromProto3Json(proto3Json)).fold((l) {
    return GetResponse()
      ..result = false
      ..errorMessage = l.toJson();
  }, (r) {
    return GetResponse()
      ..result = true
      ..mergeFromProto3Json(filmActorOrm.recordToProto3Json());
  });
}

Future<InsertResponse> executeInsert(List<Film_actorToInsert> data,
    bool inTransaction, PostgreSQLConnection connection) async {
  var response = InsertResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
        response.errorMessage.addAll(await performAllInserts(
            data, Film_actor_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllInserts(
          data, Film_actor_ORM(newConnection(pgconnection)), inTransaction));
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
    List<Film_actorToInsert> data, Film_actor_ORM orm, bool inTransaction) async {
  var result = <String>[];
  for (var film_actor in data) {
    var error = (await tryToInsert(
        orm, film_actor.toProto3Json() as Map<String, dynamic>));
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
    Film_actor_ORM orm, Map<String, dynamic> data) async {
  try {
    var result = <String>[];
    (await orm.insertFromProto3Json(data))
        .leftMap((l) => result.add(l.toJson()));
    return result;
  } catch (e) {
    return [e.toString()];
  }
}

Future<UpdateResponse> executeUpdate(List<Film_actor> data,
    bool inTransaction, PostgreSQLConnection connection) async {
  var response = UpdateResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
        response.errorMessage.addAll(await performAllUpdates(
            data, Film_actor_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllUpdates(
          data, Film_actor_ORM(newConnection(pgconnection)), inTransaction));
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
    List<Film_actor> data, Film_actor_ORM orm, bool inTransaction) async {
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
    Film_actor_ORM orm, Map<String, dynamic> data) async {
  try {
    var result = <String>[];
    (await orm.updateFromProto3Json(data))
        .leftMap((l) => result.add(l.toJson()));
    return result;
  } catch (e) {
    return [e.toString()];
  }
}

Future<DeleteResponse> executeDelete(List<Film_actorPk> pkData,
    bool inTransaction, PostgreSQLConnection connection) async {
  var response = DeleteResponse();
  final nextCompleter = Completer.sync();
  var pgconnection = newPGConnection(connection);
  try {
    if (inTransaction) {
      await pgconnection.open();
      await pgconnection.transaction((connection) async {
      response.errorMessage.addAll(await performAllDeletes(
          pkData, Film_actor_ORM.fromConnection(connection), inTransaction));
      });
    } else {
      response.errorMessage.addAll(await performAllDeletes(
          pkData, Film_actor_ORM(newConnection(pgconnection)), inTransaction));
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
    List<Film_actorPk> pkData, Film_actor_ORM orm, bool inTransaction) async {
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
    Film_actor_ORM orm, Map<String, dynamic> data) async {
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
  var ds = ((await Film_actor_ORM(connection).select(
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
      case SelectableColumns.actorId:
        name = 'actor_id';
        break;
      case SelectableColumns.filmId:
        name = 'film_id';
        break;
      case SelectableColumns.lastUpdate:
        name = 'last_update';
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
