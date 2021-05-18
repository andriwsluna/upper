import 'package:postgres/postgres.dart';

var _pgConnection = PostgreSQLConnection(
    'ec2-54-163-254-204.compute-1.amazonaws.com', 5432, 'db2tf16ao1cbq2',
    username: 'ufnkessrkawtpy',
    password:
        '9f0588f2a60ca501779aa6c2b8dca63c0b99bb3bcea3d6c94efa8d19d0d45b27',
    useSSL: true);

PostgreSQLConnection getConnection() => _pgConnection;
