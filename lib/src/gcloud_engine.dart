import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';

Future<bool> deploy({
  String workingDirectory = '',
  required String name,
  String tag = '',
  required String image,
  int port = 443,
  required String projectName,
  bool allowUnauthenticate = true,
  int maxMemory = 128,
  int timeOut = 60,
  bool verbose = false,
}) async {
  var command =
      'gcloud run deploy $name --image $image --port $port --platform managed '
      '--project $projectName --memory ${maxMemory}Mi --timeout $timeOut';

  if (allowUnauthenticate) {
    command += ' --allow-unauthenticated';
  } else {
    command += ' --no-allow-unauthenticated';
  }

  if (tag.isNotEmpty) {
    command += ' --tag $tag';
  }

  if (!verbose) {
    print('deploing $name . . .');
  }

  return await executeCommand(
    command: command,
    verbose: verbose,
    workingDirectory: workingDirectory,
  );
}

Future<bool> serviceDeploy({
  required UpperService service,
  required String projectName,
  required String gCloudProject,
  required String gcrHost,
  bool allowUnauthenticate = true,
  int port = 443,
  int timeOut = 60,
  bool verbose = false,
}) async {
  return await deploy(
    name: service.gcloudName,
    tag: getTag(service.version),
    image: getImageName(
      serviceName: service.dockerTag,
      projectName: projectName,
      gCloudProject: gCloudProject,
      gcrHost: gcrHost,
      version: service.version,
    ),
    port: port,
    projectName: gCloudProject,
    allowUnauthenticate: allowUnauthenticate,
    timeOut: timeOut,
    maxMemory: service.grcMemory,
    verbose: verbose,
  );
}

String getTag(int version) {
  if (version > 0) {
    var ver = '';
    if (version > 99) {
      ver = (version % 99).toString();
    } else {
      ver = version.toString();
    }

    return 'v' + ('0' * (2 - ver.length)) + ver;
  } else {
    return '';
  }
}

String getImageName({
  required String serviceName,
  required String projectName,
  required String gCloudProject,
  required String gcrHost,
  int version = 0,
}) {
  var project = projectName;
  if (project.isNotEmpty) {
    project += '/';
  }
  var result = '$gcrHost/$gCloudProject/$project$serviceName:';
  if (version > 0) {
    result += 'v$version';
  } else {
    result += 'lastast';
  }
  return result;
}

Future<bool> serverDeploy({
  required UpperProject project,
  bool verbose = false,
}) async {
  return await deploy(
    name: project.gcloudName,
    tag: getTag(project.version),
    image: getImageName(
      serviceName: project.gcloudName,
      projectName: '',
      gCloudProject: project.gcloudProject,
      gcrHost: project.gcrHost,
      version: project.version,
    ),
    port: project.portNumer,
    projectName: project.gcloudProject,
    allowUnauthenticate: project.gcrAllowUnauthenticated,
    timeOut: project.gcrTimeout,
    maxMemory: project.gcrMemory,
    verbose: verbose,
  );
}

Future<bool> microServicesDeploy({
  required UpperProject project,
  bool verbose = false,
}) async {
  var result = true;
  for (var service in project.services) {
    result = result &&
        await deploy(
          name: service.gcloudName,
          tag: getTag(service.version),
          image: getImageName(
            serviceName: service.dockerTag,
            projectName: project.gcloudName,
            gCloudProject: project.gcloudProject,
            gcrHost: project.gcrHost,
            version: service.version,
          ),
          port: project.portNumer,
          projectName: project.gcloudProject,
          allowUnauthenticate: project.gcrAllowUnauthenticated,
          timeOut: project.gcrTimeout,
          maxMemory: service.grcMemory,
          verbose: verbose,
        );
  }
  return result;
}
