import '../src/store_service.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'dart:io';
import 'connection.dart';

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server(
      [StoreService(getConnection())],
      const <grpc.Interceptor>[],
      grpc.CodecRegistry(codecs: [grpc.GzipCodec()]),
    );
    var sPort = Platform.environment['PORT'];
    var port = 3426;
    if ((sPort != null) && (sPort.isNotEmpty)) {
      print('sPort: $sPort');
      port = int.parse(sPort);
    }
    await server.serve(port: port);
    print('Server listening on port ${server.port}...');
  }
}