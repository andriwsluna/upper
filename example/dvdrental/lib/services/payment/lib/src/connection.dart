import 'package:postgres/postgres.dart';

var _pgConnection = PostgreSQLConnection(
    'ec2-3-224-251-47.compute-1.amazonaws.com', 5432, 'db5pbo0gcf628i',
    username: 'lprklljaicvzti',
    useSSL: true,
    password:
        '1614cea156aa98660ad86987bd6b2fc5d5fab3167a2f035e6b43f8c1024238e4');

PostgreSQLConnection getConnection() => _pgConnection;
