import 'dart:io';
import 'package:file_utils/file_utils.dart';

Future<bool> createFold(String path, String name) {
  return (Directory('$path/$name').create(recursive: true))
      .then((Directory directory) {
    return true;
  }).onError((error, stackTrace) {
    print(error.toString());
    return false;
  });
}

void writeInFile(String filePath, String fileName, String contents) {
  FileUtils.mkdir([filePath]);
  File(filePath + '/' + fileName).writeAsString(contents);
}
