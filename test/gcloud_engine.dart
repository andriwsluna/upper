@Timeout(Duration(seconds: 30000))
import 'package:test/test.dart';
import 'package:upper/src/gcloud_engine.dart';
//import 'package:upper/src/io.dart';
//import 'package:upper/static_grpc/grpc_project_json.dart';

void main() {
  // group('deploy', () {
  //   test('valid params', () async {
  //     var result = await deploy(
  //       workingDirectory: 'example/dvdrental',
  //       name: 'dvdrental-actor',
  //       tag: 'v01',
  //       image: 'gcr.io/andriwsluna-grpc-server/dvdrental/actor:v1',
  //       port: 443,
  //       projectName: 'andriwsluna-grpc-server',
  //       verbose: true,
  //     );

  //     expect(result, true);
  //   });

  //   test('out of directory', () async {
  //     var result = await deploy(
  //       name: 'dvdrental-actor',
  //       tag: 'v01',
  //       image: 'gcr.io/andriwsluna-grpc-server/dvdrental/actor:v1',
  //       port: 443,
  //       projectName: 'andriwsluna-grpc-server',
  //       verbose: true,
  //     );

  //     expect(result, true);
  //   });

  //   test('invalid name', () async {
  //     var result = await deploy(
  //       name: 'dvdrental/actor',
  //       tag: 'v01',
  //       image: 'gcr.io/andriwsluna-grpc-server/dvdrental/actor:v1',
  //       port: 443,
  //       projectName: 'andriwsluna-grpc-server',
  //       verbose: true,
  //     );

  //     expect(result, false);
  //   });

  //   test('invalid image', () async {
  //     var result = await deploy(
  //       name: 'dvdrental-actor',
  //       tag: 'v01',
  //       image: 'gcr.io/anrpc-server/dvdrental/actor:v1',
  //       port: 443,
  //       projectName: 'andriwsluna-grpc-server',
  //       verbose: true,
  //     );

  //     expect(result, false);
  //   });
  // });

  group('getTag', () {
    test('1 number', () {
      expect(getTag(1), 'v01');
    });

    test('2 number', () {
      expect(getTag(10), 'v10');
    });

    test('99', () {
      expect(getTag(99), 'v99');
    });

    test('3 number', () {
      expect(getTag(100), 'v01');
    });

    test('negative', () {
      expect(getTag(-1), '');
    });

    test('zero', () {
      expect(getTag(0), '');
    });
  });

  group('getImageName', () {
    test('valid full', () {
      expect(
        getImageName(
          serviceName: 'actor',
          projectName: 'dvdrental',
          gCloudProject: 'grpc-server',
          gcrHost: 'gcr.io',
          version: 1,
        ),
        'gcr.io/grpc-server/dvdrental/actor:v1',
      );
    });

    test('without project', () {
      expect(
        getImageName(
          serviceName: 'dvdrental',
          projectName: '',
          gCloudProject: 'grpc-server',
          gcrHost: 'gcr.io',
          version: 1,
        ),
        'gcr.io/grpc-server/dvdrental:v1',
      );
    });

    test('without versiom', () {
      expect(
        getImageName(
          serviceName: 'actor',
          projectName: 'dvdrental',
          gCloudProject: 'grpc-server',
          gcrHost: 'gcr.io',
        ),
        'gcr.io/grpc-server/dvdrental/actor:lastast',
      );
    });
  });

  // group('serviceDeploy', () {
  //   UpperService? service;
  //   loadJson('example/dvdrental/upper.json').map((r) {
  //     getUpperProjectFromMap(r).map((r) => service = r.services.first);
  //   });
  //   test('valid arguments', () async {
  //     if (service != null) {
  //       var result = await serviceDeploy(
  //         service: service as UpperService,
  //         projectName: 'dvdrental',
  //         gCloudProject: 'andriwsluna-grpc-server',
  //         gcrHost: 'gcr.io',
  //         verbose: true,
  //       );

  //       expect(result, true);
  //     }
  //   });
  // });

  // group('serverDeploy', () {
  //   UpperProject? project;
  //   loadJson('example/dvdrental/upper.json').map((r) {
  //     getUpperProjectFromMap(r).map((r) => project = r);
  //   });
  //   test('valid arguments', () async {
  //     if (project != null) {
  //       var result = await serverDeploy(
  //         project: project as UpperProject,
  //         verbose: true,
  //       );

  //       expect(result, true);
  //     }
  //   });
  // });

  // group('microServicesDeploy', () {
  //   UpperProject? project;
  //   loadJson('example/dvdrental/upper.json').map((r) {
  //     getUpperProjectFromMap(r).map((r) => project = r);
  //   });
  //   test('valid arguments', () async {
  //     if (project != null) {
  //       var result = await microServicesDeploy(
  //         project: project as UpperProject,
  //         verbose: true,
  //       );

  //       expect(result, true);
  //     }
  //   });
  // });
}
