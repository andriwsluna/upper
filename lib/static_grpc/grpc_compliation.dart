import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';

Future<bool> compileProtoFile({
  required String protoFile,
  required String outPutPath,
  String workingDirectory = '',
}) async {
  return await executeCommand(
    verbose: true,
    command: 'protoc --dart_out=grpc:$outPutPath -Iprotos $protoFile',
    workingDirectory: workingDirectory,
    throwOnError: true,
  );
}

Future<bool> compileProtoFileFromService({
  required UpperService service,
  required String workingDirectory,
}) async {
  return await compileProtoFile(
      protoFile: 'protos/${service.protoName}',
      outPutPath: service.protoPath,
      workingDirectory: workingDirectory);
}

Future<bool> compileProtoFileFromProject({
  required UpperProject project,
  required String workingDirectory,
}) async {
  var result = true;

  for (var service in project.services) {
    result = result &&
        ((await compileProtoFileFromService(
          service: service,
          workingDirectory: workingDirectory,
        )));
  }

  return result;
}
