import 'package:postgres/postgres.dart';
import 'package:static_grpc_generator/static_grpc_generator.dart';

Future<bool> createProjectFiles(
  PostgreSQLConnection connection, {
  required String path,
  required String name,
}) async {
  var fullpath = '$path/$name';

  return await generatePgProto3(connection,
      path: '$fullpath/protos', schemaInName: true);
}
