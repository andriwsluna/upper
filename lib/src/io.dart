import 'dart:convert';
import 'dart:io';
import 'package:file_utils/file_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:process_run/shell.dart';

Future<bool> createFold(String path, String name) async {
  try {
    Directory('$path/$name').createSync(recursive: true);
    return (Directory('$path/$name')).existsSync();
  } on Exception {
    return false;
  }
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

Future<bool> executeCommand({
  required String command,
  verbose = true,
  workingDirectory = '',
  throwOnError = true,
}) async {
  var wDir = workingDirectory;
  if (wDir == '') {
    wDir = Directory.current.path;
  }
  if (Directory(wDir).existsSync()) {
    try {
      await Shell(
              verbose: verbose,
              runInShell: Platform.isWindows,
              workingDirectory: wDir,
              throwOnError: throwOnError)
          .run(command);
      return true;
    } catch (e) {
      return false;
    }
  } else {
    return false;
  }
}
