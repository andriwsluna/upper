import 'package:upper/static_grpc/project_creator.dart';
import 'package:test/test.dart';
import 'package:postgres/postgres.dart';
import 'dart:io';

void main() {
  group('createProjectFromPostgresDatabase', () {
    var pgConnection = PostgreSQLConnection('192.168.1.81', 5432, 'db_teste',
        username: 'postgres', password: '1489');

    var path = 'temp';
    var name = 'test_1';

    tearDown(() {
      if (Directory('$path/$name').existsSync()) {
        Directory('$path/$name').deleteSync(recursive: true);
      }
    });

    test('test one', () async {
      path = '/Volumes/MacDocs/dev/dart/projects';
      name = 'test_one';
      if (Directory('$path/$name').existsSync()) {
        Directory('$path/$name').deleteSync(recursive: true);
      }
      var r = await createProjectFromPostgresDatabase(pgConnection,
          path: path, name: name);
      expect(r, true);
    });
  });
}