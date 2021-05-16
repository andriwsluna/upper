import 'package:upper/static_grpc/grpc_compliation.dart';
import 'package:test/test.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';
import 'package:upper/static_grpc/grpc_compiler.dart';

void main() {
  group('compileProtoFile', () {
    test('valid params', () async {
      var result = await compileProtoFile(
        workingDirectory: 'example/product',
        protoFile: 'protos/produto.proto',
        outPutPath: 'lib/services/produto/lib/proto_generated',
      );

      expect(result, true);
    });

    test('invalid protoFile', () async {
      var result = await compileProtoFile(
        workingDirectory: 'example/product',
        protoFile: 'protos/jubi.proto',
        outPutPath: 'lib/services/produto/lib/proto_generated',
      );
      expect(result, false);
    });

    test('invalid workingDir', () async {
      var result = await compileProtoFile(
        workingDirectory: '',
        protoFile: 'protos/produto.proto',
        outPutPath: 'lib/services/produto/lib/proto_generated',
      );

      expect(result, false);
    });

    test('no workingDir', () async {
      var result = await compileProtoFile(
        protoFile: 'protos/produto.proto',
        outPutPath: 'lib/services/produto/lib/proto_generated',
      );
      expect(result, false);
    });
  });

  group('compileProtoFileFromService', () {
    UpperService? service;
    loadJson('example/product/upper.json').map((r) {
      getUpperProjectFromMap(r).map((r) => service = r.services.first);
    });
    test('valid arguments', () async {
      if (service != null) {
        var result = await compileProtoFileFromService(
          service: service as UpperService,
          workingDirectory: 'example/product',
        );

        expect(result, true);
      }
    });

    test('invalid worDir', () async {
      if (service != null) {
        var result = await compileProtoFileFromService(
          service: service as UpperService,
          workingDirectory: 'product',
        );

        expect(result, false);
      }
    });
  });

  group('compileProtoFileFromProject', () {
    UpperProject? project;
    loadJson('example/product/upper.json').map((r) {
      getUpperProjectFromMap(r).map((r) => project = r);
    });
    test('valid arguments', () async {
      if (project != null) {
        var result = await compileProtoFileFromProject(
          project: project as UpperProject,
          workingDirectory: 'example/product',
        );

        expect(result, true);
      }
    });
  });

  group('executeCompileProtos', () {
    var project;
    loadJson('example/product/upper.json').map((r) {
      project = r;
    });
    test('invalid arguments', () async {
      if (project != null) {
        (project as Map<String, dynamic>)
            .removeWhere((key, value) => key == 'name');
        var result = await executeCompileProtos(
          project,
          path: 'example/product',
        );

        expect(result, false);
      }
    });
  });
}
