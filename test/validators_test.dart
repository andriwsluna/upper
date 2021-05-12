import 'package:test/test.dart';
import 'package:upper/static_grpc/validators.dart';
import 'package:postgres/postgres.dart';

void main() {
  group('testConnection', () {
    test('valid connection', () async {
      var pgConnection = PostgreSQLConnection(
          'ec2-3-224-251-47.compute-1.amazonaws.com', 5432, 'db5pbo0gcf628i',
          username: 'lprklljaicvzti',
          useSSL: true,
          password:
              '1614cea156aa98660ad86987bd6b2fc5d5fab3167a2f035e6b43f8c1024238e4');
      var i = 0;
      var result = await testConnection(pgConnection, i);

      expect(result > 0, true, reason: 'result');
    });

    test('invalid connection', () async {
      var pgConnection = PostgreSQLConnection('192.1.1.81', 5432, 'db_teste',
          username: 'postgres', password: '123', timeoutInSeconds: 1);
      var i = 0;
      var result = await testConnection(pgConnection, i);

      expect(result, 0, reason: 'result');
    });

    test('oppened connection', () async {
      var pgConnection = PostgreSQLConnection(
          'ec2-3-224-251-47.compute-1.amazonaws.com', 5432, 'db5pbo0gcf628i',
          username: 'lprklljaicvzti',
          useSSL: true,
          password:
              '1614cea156aa98660ad86987bd6b2fc5d5fab3167a2f035e6b43f8c1024238e4');
      await pgConnection.open();
      var i = 0;
      var result = await testConnection(pgConnection, i);

      expect(result > 0, true, reason: 'result');
    });
  });
}
