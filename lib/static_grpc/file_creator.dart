import 'package:postgres/postgres.dart';
import 'package:static_grpc_generator/static_grpc_generator.dart';
import 'package:static_orm_generator/static_orm_generator.dart';
import 'package:upper/upper.dart';
import 'package:strings/strings.dart';
import 'package:upper/src/io.dart';
import 'package:pretty_json/pretty_json.dart';

var _serviceList = '';
var _importList = '';
var json = <String, dynamic>{};
List<Map<String, dynamic>> services = [];

Future<bool> createProjectFiles(PostgreSQLConnection connection,
    {required String path,
    required String name,
    bool schemaInName = false}) async {
  print('Creating project files. . .');
  var fullpath = '$path/$name';

  return generatePgProto3(
    connection,
    path: '$fullpath/protos',
    schemaInName: schemaInName,
  ).then((value) async =>
      value &&
      await generatePgGrpcService(
        connection,
        path: '$fullpath/lib/services',
        subPath: 'lib/src',
        schemaInName: schemaInName,
      ).then((value) async =>
          value &&
          await generatePgOrm(
            connection,
            path: '$fullpath/lib/services',
            subPath: 'lib/src',
            schemaInName: schemaInName,
          ).then((value) async =>
              value &&
              await createProjectAdditionalFiles(
                connection,
                path: path,
                name: name,
                schemaInName: schemaInName,
              ))));
}

Future<bool> createProjectAdditionalFiles(PostgreSQLConnection connection,
    {required String path,
    required String name,
    bool schemaInName = false}) async {
  print('Creating additional project files. . .');
  json.addAll({
    'name': name,
    'version': 1,
    'port_number': 8080,
    'docker_tag': camelize(name).toLowerCase(),
    'gcloud_name': camelize(name).toLowerCase(),
  });
  return getTables(connection).then((dataset) async {
    if (dataset.isNotempty) {
      var result;

      for (var record in dataset.records) {
        var fullpath =
            '$path/$name/lib/services/${getServicePath(record, schemaInName)}';

        services.add({
          'name': getServiceClassName(record, schemaInName),
          'version': 1,
          'table_name': getTableName(record),
          'path': 'lib/services/${getServicePath(record, schemaInName)}',
          'server_file_name': '${getServerFileName(record, schemaInName)}',
          'service_file_name': '${getServiceFileName(record, schemaInName)}',
          'service_class_name': '${getServiceClassName(record, schemaInName)}',
          'proto_name': '${getTableName(record).toLowerCase()}.proto',
          'proto_path':
              'lib/services/${getServicePath(record, schemaInName)}/lib/proto_generated',
          'docker_tag': camelize(getTableName(record)).toLowerCase(),
          'gcloud_name': camelize(getTableName(record)).toLowerCase(),
        });

        result = await createAdditionalFiles(
          connection,
          record,
          path: fullpath,
          packageName: name,
          schemaInName: schemaInName,
        );

        if (!result) {
          return false;
        }

        await executeCommand(
            verbose: true,
            command: '''
            protoc --dart_out=grpc:lib/services/${getServicePath(record, schemaInName)}/lib/proto_generated -Iprotos protos/${getProtoFileName(record, schemaInName)}
            ''',
            workingDirectory: '$path/$name',
            throwOnError: false);
      }

      json.addAll({'services': services});

      await writeInFile(
        '$path/$name/',
        'upper.json',
        prettyJson(json, indent: 2),
      );

      await executeCommand(
        verbose: true,
        command: 'pub get',
        workingDirectory: '$path/$name',
      );

      await writeInFile(
        '$path/$name/lib/src',
        'service_list.dart',
        getServiceList(),
      );

      return true;
    } else {
      return false;
    }
  });
}

Future<bool> createAdditionalFiles(
    PostgreSQLConnection connection, Map<String, DataField> record,
    {required String path,
    required bool schemaInName,
    required String packageName}) async {
  var serviceFileName = getServiceFileName(record, schemaInName);
  var serviceClassName = getServiceClassName(record, schemaInName);
  var serverFileName = getServerFileName(record, schemaInName);
  var servicePath = getServicePath(record, schemaInName);

  print('Generating additional files for $serviceClassName . . .');
  await createFold('$path/lib', 'proto_generated');
  return await writeInFile(
          '$path/bin/', 'server.dart', getServer(serverFileName)) &&
      await writeInFile(
          '$path/lib/src', 'connection.dart', getConnection(connection)) &&
      await writeInFile('$path', 'Dockerfile', getDockerFile()) &&
      await writeInFile(path, 'README.md', getReadMe()) &&
      await writeInFile(path, 'pubspec.yaml', getPubSpec(serviceClassName)) &&
      await writeInFile(path, 'CHANGELOG.md', getChangelog()) &&
      await writeInFile(
          '$path/lib/src',
          serverFileName,
          getTableService(
              serviceFileName, serviceClassName, servicePath, packageName));
}

Future<Dataset> getTables(PostgreSQLConnection connection) async {
  var sql = <String>[];

  sql
    ..add('select')
    ..add('cast (table_schema as varchar),')
    ..add('cast(table_name as varchar)')
    ..add('from information_schema.tables')
    ..add("where table_schema not in ('pg_catalog','information_schema')")
    ..add("and tables.table_type = 'BASE TABLE'")
    ..add('order by table_schema, table_name');
  var con = newPGConnection(connection);
  await con.open();
  var r = pgSqlToDataset(await con.query(sql.asText()));
  await con.close();
  return r;
}

extension _StringList on List<String> {
  String asText() {
    var x = '';
    forEach((element) {
      x += '\n' + element;
    });
    return x.replaceFirst('\n', '');
  }
}

String getServicePath(Map<String, DataField> record, bool schemaInName) {
  var schema = getSchemaName(record);
  var name = getTableName(record);

  if (schemaInName) {
    return '${capitalize(schema)}${capitalize(name).toLowerCase()}';
  } else {
    return '${capitalize(name).toLowerCase()}';
  }
}

String getTableName(Map<String, DataField> record) {
  var name = '';

  record['table_name']?.tryGetValue((table_name) {
    name = (table_name as String).toLowerCase();
    return true;
  });

  return name;
}

String getSchemaName(Map<String, DataField> record) {
  var name = '';

  record['table_schema']?.tryGetValue((table_name) {
    name = (table_name as String).toLowerCase();
    return true;
  });

  return name;
}

extension Snake on String {
  String add(String complement) {
    return '$this\n$complement';
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

String getServiceFileName(Map<String, DataField> record, bool schemaInName) {
  var schema = getSchemaName(record);
  var name = getTableName(record);

  if (schemaInName) {
    return '${schema}_${name}_service.dart';
  } else {
    return '${name}_service.dart';
  }
}

String getServerFileName(Map<String, DataField> record, bool schemaInName) {
  var schema = getSchemaName(record);
  var name = getTableName(record);

  if (schemaInName) {
    return '${schema}_${name}_server.dart';
  } else {
    return '${name}_server.dart';
  }
}

String getProtoFileName(Map<String, DataField> record, bool schemaInName) {
  var schema = getSchemaName(record).toLowerCase();
  var name = getTableName(record).toLowerCase();

  if (schemaInName) {
    return '${schema}_$name.proto';
  } else {
    return '$name.proto';
  }
}

String getServiceClassName(Map<String, DataField> record, bool schemaInName) {
  var schema = getSchemaName(record);
  var name = getTableName(record);

  if (schemaInName) {
    return '${schema.capitalize()}${name.capitalize()}Service';
  } else {
    return '${name.capitalize()}Service';
  }
}

String getServer(String serverFileName) {
  var content = '// ignore: avoid_relative_lib_imports'
      .add("import '../lib/src/$serverFileName';")
      .add('')
      .add('Future<void> main(List<String> args) async {')
      .add('  await Server().main(args);')
      .add('}');
  return content;
}

String getConnection(PostgreSQLConnection connection) {
  var content = '''
import 'package:postgres/postgres.dart';

var _pgConnection = PostgreSQLConnection(
  '${connection.host}',
  ${connection.port},
  '${connection.databaseName}',
  username: '${connection.username}',
  password: '${connection.password}',
  useSSL : ${connection.useSSL}
);

PostgreSQLConnection getConnection() => _pgConnection;
  ''';
  return content;
}

String getTableService(String serviceFileNamse, String serviceClassName,
    String servicePath, String packageName,
    {int port = 8080}) {
  var content = "import '../src/$serviceFileNamse';"
      .add("import 'package:grpc/grpc.dart' as grpc;")
      .add("import 'dart:io';")
      .add("import 'connection.dart';")
      .add('')
      .add('class Server {')
      .add('  Future<void> main(List<String> args) async {')
      .add('    final server = grpc.Server(')
      .add('      [$serviceClassName(getConnection())],')
      .add('      const <grpc.Interceptor>[],')
      .add('      grpc.CodecRegistry(codecs: [grpc.GzipCodec()]),')
      .add('    );')
      .add("    var sPort = Platform.environment['PORT'];")
      .add('    var port = $port;')
      .add('    if ((sPort != null) && (sPort.isNotEmpty)) {')
      .add("      print('sPort: \$sPort');")
      .add('      port = int.parse(sPort);')
      .add('    }')
      .add('    await server.serve(port: port);')
      .add("    print('Server listening on port \${server.port}...');")
      .add('  }')
      .add('}');
  _serviceList =
      _serviceList.add('  list.add($serviceClassName(getConnection()));');
  _importList = _importList.add(
      "import 'package:$packageName/services/$servicePath/lib/src/$serviceFileNamse';");

  return content;
}

String getDockerFile() {
  var content = '''
FROM google/dart
# uncomment the following if you want to ensure latest Dart and root CA bundle
#RUN apt -y update && apt -y upgrade
WORKDIR /app
COPY pubspec.yaml .
RUN dart pub get
COPY . .
RUN dart pub get --offline
RUN dart compile exe /app/bin/server.dart -o /app/bin/server

FROM subfuzion/dart:slim
COPY --from=0 /app/bin/server /app/bin/server
# COPY any other directories or files you may require at runtime, ex:
#COPY --from=0 /app/static/ /app/static/
EXPOSE 8080
ENTRYPOINT ["/app/bin/server"]
  ''';
  return content;
}

String getReadMe() {
  var content =
      'A GRPC micro service created by [Upper framework](https://pub.dev/packages/upper)';
  return content;
}

String getPubSpec(String name) {
  var content = 'name: $name'
      .add('description: A GRPC micro service created by Upper framework.')
      .add('# version: 1.0.0')
      .add('# homepage: https://www.example.com')
      .add('')
      .add('environment:')
      .add(" sdk: '>=2.12.0 <3.0.0'")
      .add('')
      .add('dependencies:')
      .add('  postgres: ^2.3.2')
      .add('  async: ^2.5.0')
      .add('  grpc: ^3.0.0')
      .add('  protobuf: ^2.0.0')
      .add('  upper:')
      .add('  static_postgres_orm:')
      .add('  dartz:')
      .add('  data_db:')
      .add('  static_grpc:')
      .add('')
      .add('dev_dependencies:')
      .add('  test: ^1.16.8')
      .add('  pedantic: ^1.9.0');

  return content;
}

String getChangelog() {
  var content =
      '## 1.0.0'.add('').add('- Initial version, created by Stagehand');
  return content;
}

String getServiceList() {
  var content = "import 'package:grpc/grpc.dart' as grpc;"
      .add("import 'connection.dart';")
      .add(_importList)
      .add('')
      .add('List<grpc.Service> getServices() {')
      .add('  var list = <grpc.Service>[];')
      .add(_serviceList)
      .add('  return list;')
      .add('}');
  return content;
}
