import 'package:postgres/postgres.dart';
import 'package:upper/static_grpc/validators.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_structure.dart';

Future<bool> createProjectFromPostgresDatabase(
  PostgreSQLConnection pgConnection, {
  String path = '',
  String name = 'static_grpc_server',
}) async {
  var result = false;
  try {
    return testConnection(pgConnection).then((value) {
      return createFold(path, name)
          .then((value) => createProjectStructure(path, name));
    });
  } on Exception catch (e) {
    print(e.toString());
  } finally {
    return result;
  }
}
