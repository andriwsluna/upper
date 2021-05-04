import 'package:upper/src/io.dart';
import 'package:postgres/postgres.dart';

Future<bool> createProjectStructure(
    String path, String name, PostgreSQLConnection connection) async {
  try {
    var projectpath = '$path/$name';
    return await createFold(projectpath, 'lib')
        .then((value) => createFold(projectpath, 'bin'))
        .then((value) => createFold(projectpath, 'protos'))
        .then((value) => createFold(projectpath, 'test'))
        .then((value) => createFold('$projectpath/lib', 'services'))
        .then((value) => createFold('$projectpath/lib', 'src'))
        .then((value) => writeFiles(projectpath, name, connection));
  } on Exception catch (e) {
    print(e.toString());
    return false;
  }
}

extension Snake on String {
  String add(String complement) {
    return '$this\n$complement';
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

bool writeFiles(String path, String name, PostgreSQLConnection connection) {
  var result = false;
  try {
    writeInFile(path, 'README.md', getReadMe());
    writeInFile(path, 'pubspec.yaml', getPubSpec(name));
    writeInFile(path, 'CHANGELOG.md', getChangelog());
    writeInFile('$path/lib/src', 'connection.dart', getConnection(connection));
    writeInFile('$path/lib/src', 'service_list.dart', getEmptyServiceList());
    writeInFile('$path/lib/src', 'grpc_server.dart', getGrpcServer(name));
    writeInFile('$path/bin', 'server_mono.dart', getMonolithicServer(name));
    result = true;
  } on Exception catch (e) {
    print(e.toString());
  } finally {
    return result;
  }
}

String getReadMe() {
  var content =
      'A GRPC server project created by [Upper framework](https://pub.dev/packages/upper)';
  return content;
}

String getPubSpec(String name) {
  var content = 'name: $name'
      .add('description: A GRPC server project created by Upper framework.')
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

String getConnection(PostgreSQLConnection connection) {
  var content = "import 'package:postgres/postgres.dart';"
      .add('')
      .add("var _pgConnection = PostgreSQLConnection('${connection.host}',")
      .add("    ${connection.port}, '${connection.databaseName}',")
      .add(
          "    username: '${connection.username}', password: '${connection.password}');")
      .add('')
      .add('PostgreSQLConnection getConnection() => _pgConnection;');

  return content;
}

String getEmptyServiceList() {
  var content = "import 'package:grpc/grpc.dart' as grpc;"
      .add('')
      .add('List<grpc.Service> getServices() {')
      .add('  var list = <grpc.Service>[];')
      .add('  return list;')
      .add('}');

  return content;
}

String getGrpcServer(String name) {
  var content = "import 'package:grpc/grpc.dart' as grpc;"
      .add("import 'dart:io';")
      .add("import 'package:$name/src/service_list.dart';")
      .add('')
      .add('class Server {')
      .add('  Future<void> main(List<String> args) async {')
      .add('    final server = grpc.Server(')
      .add('      getServices(),')
      .add('      const <grpc.Interceptor>[],')
      .add('      grpc.CodecRegistry(codecs: [grpc.GzipCodec()]),')
      .add('    );')
      .add("    var sPort = Platform.environment['PORT'];")
      .add('    var port = 443;')
      .add('    if ((sPort != null) && (sPort.isNotEmpty)) {')
      .add("      print('sPort: \$sPort');")
      .add('      port = int.parse(sPort);')
      .add('    }')
      .add('    await server.serve(port: port);')
      .add("    print('Server listening on port \${server.port}...');")
      .add('  }')
      .add('}');

  return content;
}

String getMonolithicServer(String name) {
  var content = "import 'package:$name/src/grpc_server.dart';"
      .add('')
      .add('Future<void> main(List<String> args) async {')
      .add('  await Server().main(args);')
      .add('}');

  return content;
}
