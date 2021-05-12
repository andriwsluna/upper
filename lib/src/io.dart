import 'dart:convert';
import 'dart:io';
import 'package:file_utils/file_utils.dart';
import 'package:dartz/dartz.dart';

Future<bool> createFold(String path, String name) {
  return (Directory('$path/$name').create(recursive: true))
      .then((Directory directory) {
    return true;
  }).onError((error, stackTrace) {
    print(error.toString());
    return false;
  });
}

Future<bool> writeInFile(String filePath, String fileName, String contents,
    {FileMode mode = FileMode.write}) async {
  FileUtils.mkdir([filePath]);

  var x = await File(filePath + '/' + fileName).writeAsString(
    contents,
    mode: mode,
  );
  return await x.exists();
}

Either<String, Map<String, dynamic>> loadJson(String fileName) {
  if (File(fileName).existsSync()) {
    var fileContent = File(fileName).readAsStringSync();
    try {
      return right(jsonDecode(fileContent));
    } on Exception catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  } else {
    return left('file "$fileName" not found');
  }
}
