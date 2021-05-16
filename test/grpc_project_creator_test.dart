import 'package:upper/static_grpc/project_creator.dart';
import 'package:test/test.dart';
import 'package:postgres/postgres.dart';
import 'dart:io';

void main() {
  group('createProjectFromPostgresDatabase', () {
    var pgConnection = PostgreSQLConnection(
        'ec2-3-224-251-47.compute-1.amazonaws.com', 5432, 'db5pbo0gcf628i',
        username: 'lprklljaicvzti',
        useSSL: true,
        password:
            '1614cea156aa98660ad86987bd6b2fc5d5fab3167a2f035e6b43f8c1024238e4');

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
    var r = await updateProject(path: 'example/dvdrental/');
    expect(r, true);
    var r2 = await updateProject();
    expect(r2, false);
  });

  test('compileProtos', () async {
    var r = await compileProtos(path: 'example/dvdrental/');
    expect(r, true);
    var r2 = await compileProtos();
    expect(r2, false);
  });
}
