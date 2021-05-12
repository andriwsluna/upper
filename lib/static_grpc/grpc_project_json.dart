import 'package:dartz/dartz.dart';

class UpperProject {
  final String name;
  final int version;
  final int portNumer;
  final String dockerTag;
  final String gcloudName;
  final List<UpperService> services;

  UpperProject({
    required this.name,
    required this.version,
    required this.portNumer,
    required this.dockerTag,
    required this.gcloudName,
    required this.services,
  });
}

class UpperService {
  final String name;
  final int version;
  final String tableName;
  final String path;
  final String serverFileName;
  final String serviceFileName;
  final String serviceClassName;
  final String protoName;
  final String protoPath;
  final String dockerTag;
  final String gcloudName;

  UpperService({
    required this.name,
    required this.version,
    required this.tableName,
    required this.path,
    required this.serverFileName,
    required this.serviceFileName,
    required this.serviceClassName,
    required this.protoName,
    required this.protoPath,
    required this.dockerTag,
    required this.gcloudName,
  });
}

Either<String, UpperProject> getUpperProjectFromMap(
  Map<String, dynamic> upperJson,
) {
  return verifyMap(
    upperJson,
    [
      'name',
      'version',
      'port_number',
      'docker_tag',
      'gcloud_name',
      'services',
    ],
  ).fold(
    () {
      return getUpperServices(upperJson['services']).fold(
        (l) => left(l),
        (services) {
          return right(UpperProject(
              name: upperJson['name'],
              version: upperJson['version'],
              portNumer: upperJson['port_number'],
              dockerTag: upperJson['docker_tag'],
              gcloudName: upperJson['gcloud_name'],
              services: services));
        },
      );
    },
    (a) => left(a),
  );
}

Either<String, List<UpperService>> getUpperServices(
  List<dynamic> services,
) {
  var result = <UpperService>[];
  var errors = '';
  services.forEach((element) {
    getUpperServiceFromMap(element).fold(
      (l) => errors += l,
      (r) => result.add(r),
    );
  });
  if (errors.isNotEmpty) {
    return left(errors);
  } else {
    return right(result);
  }
}

Either<String, UpperService> getUpperServiceFromMap(
  Map<String, dynamic> serviceJson,
) {
  return verifyMap(
    serviceJson,
    [
      'name',
      'version',
      'table_name',
      'path',
      'server_file_name',
      'service_file_name',
      'service_class_name',
      'proto_name',
      'proto_path',
      'docker_tag',
      'gcloud_name'
    ],
  ).fold(
    () {
      return right(UpperService(
        name: serviceJson['name'],
        version: serviceJson['version'],
        tableName: serviceJson['table_name'],
        path: serviceJson['path'],
        serverFileName: serviceJson['server_file_name'],
        serviceFileName: serviceJson['service_file_name'],
        serviceClassName: serviceJson['service_class_name'],
        protoName: serviceJson['proto_name'],
        protoPath: serviceJson['proto_path'],
        dockerTag: serviceJson['docker_tag'],
        gcloudName: serviceJson['gcloud_name'],
      ));
    },
    (a) => left(a),
  );
}

Option<String> verifyMap(
  Map<String, dynamic> upperJson,
  List<String> fields,
) {
  var errors = <String>[];

  fields.forEach((key) {
    if (!upperJson.containsKey(key)) {
      errors.add('field $key is required;');
    }
  });

  if (errors.isNotEmpty) {
    return some(errors
        .toString()
        .replaceFirst('[', '')
        .replaceFirst(']', '')
        .replaceAll(', ', '\n'));
  }
  {
    return none();
  }
}
