import 'package:postgres/postgres.dart';
import 'package:upper/static_grpc/validators.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_structure.dart';
import 'package:upper/static_grpc/file_creator.dart';
import 'package:upper/static_grpc/grpc_project_update.dart';

Future<bool> createProjectFromPostgresDatabase(
  PostgreSQLConnection connection, {
  String path = '',
  String name = 'static_grpc_server',
}) async {
  var schemaCount = 2;
  return testConnection(connection, schemaCount).then((value) async {
    schemaCount = value;
    return value > 0 &&
        await createFold(path, name).then((value) async =>
            value &&
            await createProjectStructure(path, name, connection)
                .then((value) async =>
                    value &&
                    await createProjectFiles(
                      connection,
                      path: path,
                      name: name,
                      schemaInName: schemaCount > 1,
                    )));
  });
}

Future<bool> updateProject({
  String path = '',
}) async {
  return loadJson(path + 'upper.json').fold(
    (l) {
      print(l);
      return false;
    },
    (r) {
      return executeProjectUpdate(
        r,
        path: path,
      );
    },
  );
}
