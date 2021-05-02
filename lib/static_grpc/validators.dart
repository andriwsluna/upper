import 'package:postgres/postgres.dart';
import 'package:static_grpc/static_grpc.dart';

Future<bool> testConnection(PostgreSQLConnection connection) async {
  var result = false;

  try {
    var con = newPGConnection(connection);
    await con.open();
    await con.execute('select 1');
    result = true;
  } on Exception catch (e) {
    print(e.toString());
  } finally {
    return result;
  }
}
