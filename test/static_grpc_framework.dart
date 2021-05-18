import 'package:test/test.dart';
import 'package:upper/src/static_grpc_framework.dart';
import 'package:upper/src/io.dart';

void main() {
  group('create', () {
    test('empty args', () async {
      expect(await create([]), false);
    });

    test('any args', () async {
      expect(
          await create([
            '-host',
            '127.',
          ]),
          false);
    });

    test('invalid args', () async {
      expect(
        await create(
          [
            '-host',
            '127.',
            '-database',
            'ts',
            '-user',
            'ops',
          ],
        ),
        false,
      );
    });

    group('valids', () {
      tearDown(() {
        deleteFold('example/test1');
      });
      test('create successifull args', () async {
        expect(
          await create(
            [
              'test1',
              '-host',
              'ec2-54-163-254-204.compute-1.amazonaws.com',
              '-database',
              'db2tf16ao1cbq2',
              '-user',
              'ufnkessrkawtpy',
              '-password',
              '9f0588f2a60ca501779aa6c2b8dca63c0b99bb3bcea3d6c94efa8d19d0d45b27',
              '-useSSL',
              '-path',
              'example'
            ],
          ),
          true,
        );
      });
    });
  });

  test('update', () async {
    expect(
        await update([
          '-path',
          'example/product/',
        ]),
        true);
  });

  test('compile', () async {
    expect(
        await compile([
          '-path',
          'example/product/',
        ]),
        true);
  });

  group('build', () {
    test('invalid', () async {
      expect(
          await build([
            '-path',
            'example/',
          ]),
          false);
    });

    test('mono', () async {
      expect(
          await build([
            '-path',
            'example/product',
            '-mono',
          ]),
          true);
    }, timeout: Timeout(Duration(minutes: 2)));

    test('service', () async {
      expect(
          await build([
            'produto',
            '-path',
            'example/product',
          ]),
          true);
    }, timeout: Timeout(Duration(minutes: 2)));

    test('invalid service', () async {
      expect(
          await build([
            'xec',
            '-path',
            'example/product',
          ]),
          false);
    }, timeout: Timeout(Duration(minutes: 2)));

    test('all service', () async {
      expect(
          await build([
            '-path',
            'example/product',
          ]),
          true);
    }, timeout: Timeout(Duration(minutes: 2)));
  });
}
