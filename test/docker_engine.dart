@Timeout(Duration(seconds: 200))
import 'package:test/test.dart';
import 'package:upper/src/docker_engine.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';

void main() {
  group('dockerBuild', () {
    test('valid params', () async {
      var result = await dockerBuild(
        workingDirectory: 'example/product',
        tag: 'product:v1',
      );

      expect(result, true);
    });

    test('invalid tag', () async {
      var result = await dockerBuild(
        workingDirectory: 'example/product',
        tag: 'product::v1',
      );

      expect(result, false);
    });

    test('invalid workdir', () async {
      var result = await dockerBuild(
        workingDirectory: 'product',
        tag: 'product:v1',
      );

      expect(result, false);
    });
  });

  group('serviceBuild', () {
    UpperService? service;
    loadJson('example/product/upper.json').map((r) {
      getUpperProjectFromMap(r).map((r) => service = r.services.first);
    });
    test('valid arguments', () async {
      if (service != null) {
        var result = await serviceBuild(
          path: 'example/product',
          tag: 'product',
          service: service as UpperService,
          verbose: false,
        );

        expect(result, true);
      }
    });

    test('path twice', () async {
      if (service != null) {
        var result = await serviceBuild(
          path: 'example/product/',
          tag: 'product',
          service: service as UpperService,
          verbose: false,
        );

        expect(result, true);
      }
    });

    test('path empty', () async {
      if (service != null) {
        var result = await serviceBuild(
          tag: 'product',
          service: service as UpperService,
          verbose: true,
        );

        expect(result, false);
      }
    });
  });

  group('serverBuild', () {
    UpperProject? server;
    loadJson('example/product/upper.json').map((r) {
      getUpperProjectFromMap(r).map((r) => server = r);
    });
    test('valid arguments', () async {
      if (server != null) {
        var result = await serverBuild(
          path: 'example/product',
          server: server as UpperProject,
          verbose: false,
        );

        expect(result, true);
      }
    });
  });

  // group('microServicesBuild', () {
  //   UpperProject? server;
  //   loadJson('example/product/upper.json').map((r) {
  //     getUpperProjectFromMap(r).map((r) => server = r);
  //   });
  //   test('valid arguments', () async {
  //     if (server != null) {
  //       var result = await microServicesBuild(
  //         path: 'example/product',
  //         server: server as UpperProject,
  //         verbose: false,
  //       );

  //       expect(result, true);
  //     }
  //   });
  // });

  group('dockerPush', () {
    // test('valid params', () async {
    //   var result = await dockerPush(
    //     workingDirectory: 'example/product',
    //     verbose: true,
    //     tag: 'gcr.io/andriwsluna-grpc-server/product/actor:v1',
    //   );

    //   expect(result, true);
    // });

    test('invalid tag', () async {
      var result = await dockerPush(
        workingDirectory: 'example/product',
        tag: 'product::v1',
      );

      expect(result, false);
    });

    test('invalid workdir', () async {
      var result = await dockerPush(
        workingDirectory: 'tses',
        tag: 'product:v1',
      );

      expect(result, false);
    });
  });
}
