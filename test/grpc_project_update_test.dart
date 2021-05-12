import 'package:test/test.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';
import 'package:upper/static_grpc/grpc_project_update.dart';

void main() {
  var upperJson;
  loadJson('example/dvdrental/upper.json').map((r) {
    getUpperProjectFromMap(r).map((r) => upperJson = r);
  });
  var upperProject;
  loadJson('example/dvdrental/upper.json').map((r) {
    upperProject = r;
  });
  group('updateConnection', () {
    test('valid file', () async {
      var result = await updateGrpcServer(
        upperJson,
        path: 'example/dvdrental',
      );

      expect(result, true);
    });
  });

  group('updateDockerFile', () {
    test('valid file', () async {
      var result = await updateDockerFile(
        (upperJson).portNumer,
        path: 'example/dvdrental',
      );

      expect(result, true);
    });
  });

  group('updateServices', () {
    test('valid file', () async {
      var result = await updateServices(
        upperJson,
        path: 'example/dvdrental',
      );

      expect(result, true);
    });
  });

  group('executeProjectUpdate', () {
    test('valid file', () async {
      var result = await executeProjectUpdate(
        upperProject,
        path: 'example/dvdrental',
      );

      expect(result, true);
    });
  });
}
