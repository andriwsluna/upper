import 'package:postgres/postgres.dart';
import 'package:static_grpc/static_grpc.dart';

Future<int> testConnection(
    PostgreSQLConnection connection, int schemaCount) async {
  var con = newPGConnection(connection);
  try {
    await con.open();
    var sql = 'select distinct(table_schema) from information_schema.tables'
        " where table_schema not in ('pg_catalog', 'information_schema')";

    return await con.query(sql).then((value) {
      schemaCount = value.length;
      return schemaCount;
    });
  } on Exception catch (e) {
    print('error during connect to postgres-${e.toString()}');
    return 0;
  }
}
