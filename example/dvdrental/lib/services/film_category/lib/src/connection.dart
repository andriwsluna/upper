import 'package:postgres/postgres.dart';

var _pgConnection = PostgreSQLConnection('192.168.1.81', 5432, 'dvdrental',
    username: 'postgres', password: '1489', useSSL: false);

PostgreSQLConnection getConnection() => _pgConnection;
