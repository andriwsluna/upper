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

    test('invalid path', () async {
      var result = (await createFold('',
          '\\\\\/////[--cc;;,.\01453768870x \n awd wadaw dwad awd wad z \z \z x\ z\z\z\z\ z\z]'));

      expect(result, false);
    });
  });

  group('loadJson', () {
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
    test('valid file', () {
      var result = loadJson(
        'example/dvdrental/upper.json',
      );

      expect(result.isRight(), true);
    });

    test('invalid file', () {
      writeInFile('temp', 'test.json', '123');
      var result = loadJson(
        'temp/test.json',
      );

      expect(result.isRight(), false);
    });
  });
}
