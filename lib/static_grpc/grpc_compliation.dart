import 'package:process_run/shell.dart';
import 'dart:io';
import 'package:upper/static_grpc/grpc_project_json.dart';

Future<bool> compileProtoFile({
  required String protoFile,
  required String outPutPath,
  String workingDirectory = '',
}) async {
  var wDir = workingDirectory;
  if (wDir == '') {
    wDir = Directory.current.path;
  }
  if (Directory(wDir).existsSync()) {
    try {
      await Shell(
              verbose: true,
              runInShell: Platform.isWindows,
              workingDirectory: wDir,
              throwOnError: true)
          .run('''
            protoc --dart_out=grpc:$outPutPath -Iprotos $protoFile
          ''');
      return true;
    } catch (e) {
      return false;
    }
  } else {
    return false;
  }
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
