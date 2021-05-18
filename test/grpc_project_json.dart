import 'package:test/test.dart';
import 'package:upper/src/io.dart';
import 'package:upper/static_grpc/grpc_project_json.dart';

void main() {
  group('verifyMap', () {
    var upperJson;
    loadJson('example/dvdrental/upper.json').map((r) => upperJson = r);
    test('valid file', () {
      var result = verifyMap(
        upperJson,
        [
          'name',
          'version',
        ],
      );

      expect(result.isNone(), true);
    });

    test('invalid file', () {
      var result = verifyMap(
        upperJson,
        [
          'genebra',
          'aloha',
        ],
      );

      var e;
      result.map((x) => e = x);

      expect(result.isNone(), false);
      expect(e, 'field genebra is required;\nfield aloha is required;');
    });
  });

  group('getUpperServiceFromMap', () {
    var services;
    loadJson('example/dvdrental/upper.json').map((r) {
      services = r['services'];
    });

    test('valid file', () {
      var result = getUpperServiceFromMap(
        (services as List<dynamic>).first,
      );

      expect(result.isRight(), true);
    });
  });

  group('getUpperServices', () {
    var services;
    loadJson('example/dvdrental/upper.json').map((r) {
      services = r['services'];
    });

    test('valid file', () {
      var result = getUpperServices(
        services,
      );

      expect(result.isRight(), true);
    });
  });

  group('getUpperProjectFromMap', () {
    var upperJson;
    loadJson('example/dvdrental/upper.json').map((r) {
      upperJson = r;
    });

    test('valid file', () {
      var result = getUpperProjectFromMap(
        upperJson,
      );

      expect(result.isRight(), true);
    });
  });
}
