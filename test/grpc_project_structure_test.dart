import 'package:test/test.dart';
import 'package:upper/static_grpc/grpc_project_structure.dart';
import 'dart:io';

void main() {
  group('createFold', () {
    test('in outer folder', () async {
      var path = '/Volumes/MacDocs/dev/dart/projects';
      var name = 'upper_created_test';
      // var projectpath = '$path/$name';

      // if (Directory(projectpath).existsSync()) {
      //   Directory(projectpath).deleteSync(recursive: true);
      // }
      var result = await (createProjectStructure(path, name));

      expect(result, true);
    });
  });
}
