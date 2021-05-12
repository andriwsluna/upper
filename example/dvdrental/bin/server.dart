import 'package:dvdrental/src/grpc_server.dart';

Future<void> main(List<String> args) async {
  await Server().main(args);
}