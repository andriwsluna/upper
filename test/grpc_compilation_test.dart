import 'package:upper/static_grpc/grpc_compliation.dart';
import 'package:test/test.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';

void main() {
  group('compileProtoFile', () {
    test('valid params', () async {
      var result = await compileProtoFile(
        workingDirectory: 'example/dvdrental',
        protoFile: 'protos/actor.proto',
        outPutPath: 'lib/services/actor/lib/proto_generated',
      );

      expect(result, true);
    });

    test('invalid protoFile', () async {
      var result = await compileProtoFile(
        workingDirectory: 'example/dvdrental',
        protoFile: 'protos/jubi.proto',
        outPutPath: 'lib/services/actor/lib/proto_generated',
      );
      expect(result, false);
    });

    test('invalid workingDir', () async {
      var result = await compileProtoFile(
        workingDirectory: '',
        protoFile: 'protos/actor.proto',
        outPutPath: 'lib/services/actor/lib/proto_generated',
      );

      expect(result, false);
    });

    test('no workingDir', () async {
      var result = await compileProtoFile(
        protoFile: 'protos/actor.proto',
        outPutPath: 'lib/services/actor/lib/proto_generated',
      );
      expect(result, false);
    });
  });

  group('compileProtoFileFromService', () {
    UpperService? service;
    loadJson('example/dvdrental/upper.json').map((r) {
      getUpperProjectFromMap(r).map((r) => service = r.services.first);
    });
    test('valid arguments', () async {
      if (service != null) {
        var result = await compileProtoFileFromService(
          service: service as UpperService,
          workingDirectory: 'example/dvdrental',
        );

        expect(result, true);
      }
    });

    test('invalid worDir', () async {
      if (service != null) {
        var result = await compileProtoFileFromService(
          service: service as UpperService,
          workingDirectory: 'dvdrental',
        );

        expect(result, false);
      }
    });
  });

  group('compileProtoFileFromProject', () {
    UpperProject? project;
    loadJson('example/dvdrental/upper.json').map((r) {
      getUpperProjectFromMap(r).map((r) => project = r);
    });
    test('valid arguments', () async {
      if (project != null) {
        var result = await compileProtoFileFromProject(
          project: project as UpperProject,
          workingDirectory: 'example/dvdrental',
        );

        expect(result, true);
      }
    });
  });
}
