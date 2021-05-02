import 'dart:io';

Future<bool> createFold(String path, String name) {
  return (Directory('$path/$name').create(recursive: true))
      .then((Directory directory) {
    return true;
  }).onError((error, stackTrace) {
    print(error.toString());
    return false;
  });
}
