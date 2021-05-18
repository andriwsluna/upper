// Auto-generated by test_coverage. Do not edit by hand.
// Consider adding this file to your .gitignore.

import 'docker_engine.dart' as docker_engine;
import 'gcloud_engine.dart' as gcloud_engine;
import 'grpc_compilation.dart' as grpc_compilation;
import 'grpc_project_creator.dart' as grpc_project_creator;
import 'grpc_project_json.dart' as grpc_project_json;
import 'grpc_project_structure.dart' as grpc_project_structure;
import 'grpc_project_update.dart' as grpc_project_update;
import 'io.dart' as io;
import 'static_grpc_framework.dart' as static_grpc_framework;
import 'validators.dart' as validators;

void main() {
  grpc_compilation.main();
  io.main();
  gcloud_engine.main();
  validators.main();
  grpc_project_creator.main();
  grpc_project_structure.main();
  static_grpc_framework.main();
  grpc_project_update.main();
  docker_engine.main();
  grpc_project_json.main();
}
