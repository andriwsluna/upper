import 'package:upper/static_grpc/grpc_project_json.dart';
import 'grpc_compliation.dart';

Future<bool> executeCompileProtos(
  Map<String, dynamic> upperJson, {
  required String path,
}) {
  return getUpperProjectFromMap(upperJson).fold(
    (l) async {
      print(l);
      return false;
    },
    (upperJson) async {
      return await compileProtoFileFromProject(
        project: upperJson,
        workingDirectory: '',
      );
    },
  );
}
