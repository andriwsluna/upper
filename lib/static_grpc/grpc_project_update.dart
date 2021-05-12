import 'dart:io';
import 'package:upper/static_grpc/grpc_project_structure.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/file_creator.dart' as file_creator;

Future<bool> executeProjectUpdate(
  Map<String, dynamic> upperJson, {
  required String path,
}) {
  return getUpperProjectFromMap(upperJson).fold(
    (l) async {
      print(l);
      return false;
    },
    (upperJson) async {
      return await updateGrpcServer(
            upperJson,
            path: path,
          ) &&
          await updateDockerFile(
            upperJson.portNumer,
            path: path,
          ) &&
          await updateServices(
            upperJson,
            path: path,
          );
    },
  );
}

Future<bool> updateGrpcServer(
  UpperProject upperJson, {
  required String path,
}) async {
  return writeInFile(
    '$path/lib/src',
    'grpc_server.dart',
    getGrpcServer(
      upperJson.name,
      port: upperJson.portNumer,
    ),
  );
}

Future<bool> updateDockerFile(
  int port, {
  required String path,
}) async {
  return writeInFile(
    '$path',
    'Dockerfile',
    getDockerFile(
      port: port,
    ),
  );
}

Future<bool> updateServices(
  UpperProject upperJson, {
  required String path,
}) async {
  for (var service in upperJson.services) {
    (!(await updateService(
      service,
      port: upperJson.portNumer,
      path: path,
    )));
  }

  return true;
}

Future<bool> updateService(
  UpperService service, {
  required int port,
  required String path,
}) async {
  return (await updateDockerFile(
        port,
        path: '$path/${service.path}',
      )) &&
      await writeInFile(
        '$path/${service.path}/lib/src',
        service.serverFileName,
        file_creator.getTableService(
          service.serviceFileName,
          service.serviceClassName,
          service.path,
          '',
          port: port,
        ),
      ) &&
      copyConnection(
        projectPath: path,
        servicePath: '$path/${service.path}',
      );
}

bool copyConnection({
  required String projectPath,
  required String servicePath,
}) {
  File(servicePath + '/lib/src/connection.dart').writeAsStringSync(
    File(projectPath + '/lib/src/connection.dart').readAsStringSync(),
  );
  return true;
}
