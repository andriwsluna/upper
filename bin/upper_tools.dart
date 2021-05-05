import 'package:upper/src/static_grpc_framework.dart' as static_grpc;

Future<void> main(List<String> args) async {
  if (args.isNotEmpty) {
    if (commandList.containsKey(args.first)) {
      var funct = commandList[args.first]?.func;
      if (funct != null) {
        print(await (funct(args.sublist(1))));
      }
    } else {
      print('command "${args.first}" not found.');
    }
  } else {
    print('lista de comandos');
  }
}

class Command {
  final String description;
  final Future<bool> Function(List<String> args) func;

  Command(this.description, this.func);
}

final Map<String, Command> commandList = {
  'create': Command('create a GRPC Server project', static_grpc.create),
};
