import 'dart:io';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';

Future<bool> dockerBuild({
  String workingDirectory = '',
  required String tag,
  bool verbose = false,
  bool noCache = false,
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
  bool noCache = false,
}) async {
  var parentTag = tag;
  if (parentTag.isNotEmpty) {
    parentTag += '/';
  }
  return await dockerBuild(
    verbose: verbose,
    noCache: noCache,
    workingDirectory: '${Directory.current.path}/$path/${service.path}',
    tag: getServiceTag(
      service: service,
      parentTag: parentTag,
    ),
  );
}

String getServiceTag({
  required UpperService service,
  String parentTag = '',
}) {
  return '$parentTag${service.dockerTag}:v${service.version}';
}

Future<bool> serverBuild({
  required UpperProject server,
  String path = '',
  bool verbose = false,
  bool noCache = false,
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
}) async {
  var result = true;
  for (var service in server.services) {
    result = result &&
        (await serviceBuild(
          service: service,
          path: path,
          tag: getPrefixTag(server),
          verbose: verbose,
        ));
  }

  return result;
}

String getPrefixTag(UpperProject upper) {
  var ptag = '';
  if (upper.gcrHost.isNotEmpty) {
    ptag += upper.gcrHost + '/';
  }

  if (upper.gcloudProject.isNotEmpty) {
    ptag += upper.gcloudProject + '/';
  }

  ptag += upper.gcloudName;

  return ptag;
}

Future<bool> dockerPush({
  String workingDirectory = '',
  required String tag,
  bool verbose = false,
}) async {
  var command = 'docker push $tag';

  if (!verbose) {
    print('pushing $tag . . .');
  }

  return await executeCommand(
    command: command,
    verbose: verbose,
    workingDirectory: workingDirectory,
  );
}

Future<bool> servicePush({
  required UpperService service,
  String path = '',
  String tag = '',
  bool verbose = false,
}) async {
  var parentTag = tag;
  if (parentTag.isNotEmpty) {
    parentTag += '/';
  }
  return await dockerPush(
    verbose: verbose,
    workingDirectory: '${Directory.current.path}/$path/${service.path}',
    tag: getServiceTag(
      service: service,
      parentTag: parentTag,
    ),
  );
}

Future<bool> serverPush({
  required UpperProject server,
  String path = '',
  bool verbose = false,
}) async {
  return await dockerPush(
      verbose: verbose,
      workingDirectory: '${Directory.current.path}/$path',
      tag: '${server.dockerTag}:v${server.version}');
}

Future<bool> microServicesPush({
  required UpperProject server,
  String path = '',
  bool verbose = false,
}) async {
  var result = true;
  for (var service in server.services) {
    result = result &&
        (await servicePush(
          service: service,
          path: path,
          tag: getPrefixTag(server),
          verbose: verbose,
        ));
  }

  return result;
}
