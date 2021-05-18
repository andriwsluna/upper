import 'docker_engine_test.dart' as docker;
import 'gcloud_engine_test.dart' as gcloud;
import 'grpc_compilation_test.dart' as compilation;
import 'grpc_project_creator_test.dart' as creator;
import 'grpc_project_json_test.dart' as json;
import 'grpc_project_structure_test.dart' as structure;
import 'grpc_project_update_test.dart' as update;
import 'io_test.dart' as io;
import 'validators_test.dart' as validator;
import 'static_grpc_framework_test.dart' as frame;

void main() {
  docker.main();
  gcloud.main();
  compilation.main();
  creator.main();
  json.main();
  structure.main();
  update.main();
  io.main();
  frame.main();
  validator.main();
}
