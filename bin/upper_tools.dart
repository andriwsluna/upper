import 'dart:io';

import 'package:upper/src/static_grpc_framework.dart' as static_grpc;

void main(List<String> args) async {
  if (args.isNotEmpty) {
    if (_commandList.containsKey(args.first)) {
      var funct = _commandList[args.first]?.func;
      if (funct != null) {
        if (await (funct(args.sublist(1)))) {
          print('completed');
          exit(0);
        } else {
          print('failed');
          exit(-1);
        }
      }
    } else {
      print('command "${args.first}" not found.');
    }
  } else {
    _printCommandList();
  }
}

class _Command {
  final String description;
  final Future<bool> Function(List<String> args) func;

  _Command(this.description, this.func);
}

final Map<String, _Command> _commandList = {
  'create': _Command('Create a GRPC Server project', static_grpc.create),
  'update': _Command('Update a GRPC Server project', static_grpc.update),
  'compile': _Command('Compile all protos', static_grpc.compile),
  'build': _Command('Build docker image', static_grpc.build),
  'push': _Command('Push docker image', static_grpc.push),
  'deploy': _Command('Deploy images on Google Cloud Run', static_grpc.deploy),
  'release': _Command(
    'Build, Push and Deploy images on Google Cloud Run',
    static_grpc.compleDeploy,
  ),
};

void _printCommandList() {
  print('Available commands:');
  _commandList.forEach((key, value) {
    print("$key ${' ' * (15 - key.length)} -- ${value.description}");
  });
}
