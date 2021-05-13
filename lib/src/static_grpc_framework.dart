import 'package:upper/static_grpc/project_creator.dart';
import 'package:postgres/postgres.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';
import 'package:dartz/dartz.dart';
import 'package:upper/src/io.dart';
import 'package:upper/src/docker_engine.dart';
import 'dart:io';

Future<bool> create(List<String> args) async {
  if (args.isNotEmpty) {
    if (_verifyObrigatoriesParams(
      args,
      'create',
    )) {
      return (await createProjectFromPostgresDatabase(
        PostgreSQLConnection(
          getParam(args, '-host') ?? '',
          int.parse(getParam(args, '-port') ?? '5432'),
          getParam(args, '-database') ?? '',
          username: getParam(args, '-user') ?? '',
          password: getParam(args, '-password') ?? '',
          useSSL: getFlag(args, '-useSSL'),
        ),
        path: getParam(args, '-path') ?? Directory.current.absolute.path,
        name: args.first,
      ));
    } else {
      return false;
    }
  } else {
    print('The first param must be the name of project');
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

bool getFlag(List<String> args, String name) {
  return args.contains(name);
}

bool _verifyObrigatoriesParams(List<String> args, String comand) {
  var result = true;

  _requiredParams.forEach((element) {
    if (getParam(args, element) == null) {
      result = false;
      print(
          '$element${' ' * (10 - element.length)} is required for $comand command');
    }
  });
  return result;
}

Future<bool> update(List<String> args) async {
  return updateProject(
      //path: 'example/dvdrental',
      );
}

Future<bool> compile(List<String> args) async {
  return compileProtos(
      //path: 'example/dvdrental',
      );
}

Future<bool> build(List<String> args) async {
  return (await getUpperProject()).fold(
    () => false,
    (upperProject) {
      if (args.isEmpty) {
        return microServicesBuild(
          server: upperProject,
        );
      } else if (getFlag(args, '-mono')) {
        return serverBuild(
          server: upperProject,
        );
      } else {
        if (upperProject.services
            .any((element) => element.name == args.first)) {
          return serviceBuild(
              service: (upperProject.services
                  .firstWhere((element) => element.name == args.first)));
        } else {
          print('service ${args.first} not found');
          return false;
        }
      }
    },
  );
}

Future<Option<UpperProject>> getUpperProject({
  String path = '',
}) async {
  var workDir = path;
  if (path == '') {
    workDir = Directory.current.path + '/';
  } else {
    workDir = path;
  }
  print('loading upper.json');
  return loadJson(workDir + 'upper.json').fold(
    (l) {
      print(l);
      return none();
    },
    (r) {
      return getUpperProjectFromMap(r).fold(
        (l) async {
          print(l);
          return none();
        },
        (upperJson) => some(upperJson),
      );
    },
  );
}
