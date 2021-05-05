import 'package:upper/static_grpc/project_creator.dart';
import 'package:postgres/postgres.dart';
import 'dart:io';

Future<bool> create(List<String> args) async {
  print(args);

  if (args.isNotEmpty) {
    var pgConnection = PostgreSQLConnection('192.168.1.81', 5432, 'db_teste',
        username: 'postgres', password: '1489');

    var path = getParam(args, '-path') ?? Directory.current.absolute.path;
    var name = args.first;
    return (await createProjectFromPostgresDatabase(pgConnection,
        path: path, name: name));
  } else {
    return false;
  }
}

String? getParam(List<String> args, String name) {
  var index = args.indexOf(name);
  if ((index >= 0) && ((index + 1) < args.length)) {
    return args.elementAt(index + 1);
  }
}
