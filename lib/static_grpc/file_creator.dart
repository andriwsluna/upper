import 'package:postgres/postgres.dart';
import 'package:static_grpc_generator/static_grpc_generator.dart';

Future<bool> createProjectFiles(PostgreSQLConnection connection,
    {required String path,
    required String name,
    bool schemaInName = false}) async {
  var fullpath = '$path/$name';

  return generatePgProto3(
    connection,
    path: '$fullpath/protos',
    schemaInName: schemaInName,
  ).then((value) async =>
      value &&
      await generatePgGrpcService(
        connection,
        path: '$fullpath/lib/services',
        subPath: 'lib/src',
        schemaInName: schemaInName,
      ));
}
