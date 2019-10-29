import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileService {
  Future<String> getLocalPath() async {
    return getApplicationDocumentsDirectory().then((dir) => dir.path);
  }

  Future<String> readFile(String fileName) async {
    return await File(fileName).readAsString();
  }

  Future writeFile(String fileName, String content) async {
    await File(fileName).writeAsString(content);
  }

  Stream<String> listFiles(RegExp exp) async* {
    final directory = await getApplicationDocumentsDirectory();
    var files = directory.list(recursive: true);
    await for (FileSystemEntity file in files) {
      if (exp.hasMatch(file.path)) {
        yield file.path;
      }
    }
  }

  Stream<String> listAllFiles(String directoryName) async* {
    final directory = Directory(directoryName);

    if (!await directory.exists()) return;

    var files = directory.list(recursive: true);
    await for (FileSystemEntity file in files) {
      yield file.path;
    }
  }

  Future<bool> hasFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    var files = directory.list(recursive: false);
    await for (FileSystemEntity file in files) {
      if (fileName == file.path) {
        return Future.value(true);
      }
    }
    return Future.value(false);
  }
}
