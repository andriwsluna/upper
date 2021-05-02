import 'package:postgres/postgres.dart';
import 'package:upper/static_grpc/validators.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_structure.dart';
import 'package:upper/static_grpc/file_creator.dart';

Future<bool> createProjectFromPostgresDatabase(
  PostgreSQLConnection connection, {
  String path = '',
  String name = 'static_grpc_server',
}) async {
  return testConnection(connection).then((value) async =>
      value &&
      await createFold(path, name).then((value) async =>
          value &&
          await createProjectStructure(path, name).then((value) async =>
              value &&
              await createProjectFiles(connection, path: path, name: name))));
}
