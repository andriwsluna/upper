// ignore: avoid_relative_lib_imports
import '../lib/src/language_server.dart';

Future<void> main(List<String> args) async {
  await Server().main(args);
}
