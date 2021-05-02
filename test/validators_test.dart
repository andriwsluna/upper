import 'package:test/test.dart';
import 'package:upper/static_grpc/validators.dart';
import 'package:postgres/postgres.dart';

void main() {
  group('testConnection', () {
    test('valid connection', () async {
      var pgConnection = PostgreSQLConnection('192.168.1.81', 5432, 'db_teste',
          username: 'postgres', password: '1489');

      var result = await testConnection(pgConnection);

      expect(result, true, reason: 'result');
    });

    test('invalid connection', () async {
      var pgConnection = PostgreSQLConnection('192.1.1.81', 5432, 'db_teste',
          username: 'postgres', password: '1489', timeoutInSeconds: 1);

      var result = await testConnection(pgConnection);

      expect(result, false, reason: 'result');
    });

    test('oppened connection', () async {
      var pgConnection = PostgreSQLConnection('192.168.1.81', 5432, 'db_teste',
          username: 'postgres', password: '1489', timeoutInSeconds: 1);
      await pgConnection.open();
      var result = await testConnection(pgConnection);

      expect(result, true, reason: 'result');
    });
  });
}
