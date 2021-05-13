import 'dart:io';

import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';

Future<bool> dockerBuild({
  String workingDirectory = '',
  required String tag,
  bool verbose = false,
  bool noCache = true,
}) async {
  var command = 'docker build -t $tag';

  command += ' .';

  if (noCache) {
    command += ' --no-cache';
  }

  if (!verbose) {
    print('building $tag . . .');
  }

  return await executeCommand(
    command: command,
    verbose: verbose,
    workingDirectory: workingDirectory,
  );
}

Future<bool> serviceBuild({
  required UpperService service,
  String path = '',
  String tag = '',
  bool verbose = false,
  bool noCache = true,
}) async {
  var parentTag = tag;
  if (parentTag.isNotEmpty) {
    parentTag += '.';
  }
  return await dockerBuild(
      verbose: verbose,
      noCache: noCache,
      workingDirectory: '${Directory.current.path}/$path/${service.path}',
      tag: '$parentTag${service.dockerTag}:v${service.version}');
}

Future<bool> serverBuild({
  required UpperProject server,
  String path = '',
  bool verbose = false,
  bool noCache = true,
}) async {
  return await dockerBuild(
      verbose: verbose,
      noCache: noCache,
      workingDirectory: '${Directory.current.path}/$path',
      tag: '${server.dockerTag}:v${server.version}');
}

Future<bool> microServicesBuild({
  required UpperProject server,
  String path = '',
  bool verbose = false,
  bool noCache = true,
}) async {
  var result = true;

  for (var service in server.services) {
    result = result &&
        (await serviceBuild(
          service: service,
          path: path,
          tag: server.dockerTag,
          noCache: noCache,
          verbose: verbose,
        ));
  }

  return result;
}
