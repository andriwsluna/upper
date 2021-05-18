import 'package:upper/static_grpc/project_creator.dart';
import 'package:test/test.dart';
import 'package:postgres/postgres.dart';
import 'dart:io';

void main() {
  group('createProjectFromPostgresDatabase', () {
    var pgConnection = PostgreSQLConnection(
        'ec2-54-163-254-204.compute-1.amazonaws.com', 5432, 'db2tf16ao1cbq2',
        username: 'ufnkessrkawtpy',
        useSSL: true,
        password:
            '9f0588f2a60ca501779aa6c2b8dca63c0b99bb3bcea3d6c94efa8d19d0d45b27');

    var path = 'temp';
    var name = 'test_1';

    tearDown(() {
      if (Directory('$path/$name').existsSync()) {
        Directory('$path/$name').deleteSync(recursive: true);
      }
    });

    test('test one', () async {
      path = 'example/';
      name = 'test_one';
      if (Directory('$path/$name').existsSync()) {
        Directory('$path/$name').deleteSync(recursive: true);
      }
      var r = await createProjectFromPostgresDatabase(pgConnection,
          path: path, name: name);
      expect(r, true);
    }, timeout: Timeout(Duration(minutes: 1)));
  });

  test('updateProject', () async {
    var r = await updateProject(path: 'example/product/');
    expect(r, true);
    var r2 = await updateProject();
    expect(r2, false);
  });

  test('compileProtos', () async {
    var r = await compileProtos(path: 'example/product/');
    expect(r, true);
    var r2 = await compileProtos();
    expect(r2, false);
  });
}
