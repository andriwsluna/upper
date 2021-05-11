import 'package:test/test.dart';
import 'package:upper/src/io.dart';
import 'dart:io';

void main() {
  group('createFold', () {
    setUp(() {
      if (Directory('temp').existsSync()) {
        Directory('temp').deleteSync(recursive: true);
      }
    });

    tearDown(() {
      if (Directory('temp').existsSync()) {
        Directory('temp').deleteSync(recursive: true);
      }
    });

    test('valid path and name', () async {
      var result = (await createFold('temp', 'test'));

      expect(result, true);
    });
  });

  group('loadJson', () {
    test('valid file', () {
      var result = loadJson(
        'example/dvdrental/upper.json',
      );

      expect(result.isSome(), true);
    });
  });
}
