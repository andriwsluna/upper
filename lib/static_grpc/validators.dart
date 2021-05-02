import 'package:postgres/postgres.dart';
import 'package:static_grpc/static_grpc.dart';

Future<bool> testConnection(PostgreSQLConnection connection) async {
  var con = newPGConnection(connection);
  try {
    await con.open();

    return await con.query('select 1').then((value) => value.isNotEmpty);
  } on Exception {
    return false;
  }
}
