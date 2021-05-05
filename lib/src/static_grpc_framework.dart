import 'package:upper/static_grpc/project_creator.dart';
import 'package:postgres/postgres.dart';
import 'dart:io';

Future<bool> create(List<String> args) async {
  if (args.isNotEmpty) {
    if (_verifyObrigatoriesParams(args)) {
      var name = args.first;

      var path = getParam(args, '-path') ?? Directory.current.absolute.path;
      var host = getParam(args, '-host') ?? '';
      var port = getParam(args, '-port') ?? '5432';
      var database = getParam(args, '-database') ?? '';
      var user = getParam(args, '-user') ?? '';
      var password = getParam(args, '-password') ?? '';

      var pgConnection = PostgreSQLConnection(host, int.parse(port), database,
          username: user, password: password);

      return (await createProjectFromPostgresDatabase(pgConnection,
          path: path, name: name));
    } else {
      return false;
    }
  } else {
    print('The first param musb be the name of project');
    return false;
  }
}

List<String> _requiredParams = ['-host', '-database', '-user'];

String? getParam(List<String> args, String name) {
  var index = args.indexOf(name);
  if ((index >= 0) && ((index + 1) < args.length)) {
    return args.elementAt(index + 1);
  }
}

bool _verifyObrigatoriesParams(List<String> args) {
  var result = true;

  _requiredParams.forEach((element) {
    if (getParam(args, element) == null) {
      result = false;
      print(
          '$element${' ' * (10 - element.length)} is required for create command');
    }
  });
  return result;
}
