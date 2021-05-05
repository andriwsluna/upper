// import 'package:upper/static_grpc/project_creator.dart';
// import 'package:postgres/postgres.dart';
// import 'dart:io';
import 'package:upper/src/static_grpc_framework.dart' as static_grpc;

Future<void> main(List<String> args) async {
  if (args.isNotEmpty) {
    if (commandList.containsKey(args.first)) {
      commandList[args.first]?.func(args.sublist(1));
    } else {
      print('command "${args.first}" not found.');
    }
  } else {
    print('lista de comandos');
  }
}

class Command {
  final String description;
  final void Function(List<String> args) func;

  Command(this.description, this.func);
}

final Map<String, Command> commandList = {
  'create': Command('create a GRPC Server project', static_grpc.create),
};
