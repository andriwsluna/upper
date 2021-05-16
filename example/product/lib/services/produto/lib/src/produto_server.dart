import '../src/produto_service.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'dart:io';
import 'connection.dart';

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server(
      [ProdutoService(getConnection())],
      const <grpc.Interceptor>[],
      grpc.CodecRegistry(codecs: [grpc.GzipCodec()]),
    );
    var sPort = Platform.environment['PORT'];
    var port = 8080;
    if ((sPort != null) && (sPort.isNotEmpty)) {
      print('sPort: $sPort');
      port = int.parse(sPort);
    }
    await server.serve(port: port);
    print('Server listening on port ${server.port}...');
  }
}