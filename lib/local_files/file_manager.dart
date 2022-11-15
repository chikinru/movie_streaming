import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FileManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.json');
  }

  Future<int> readData() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      for (int i = 0; i < contents.length; i++) {
        print(contents[i]);
      }
      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeData(int malID) async {
    final file = await _localFile;

    print("writed");
    return file.writeAsString('$malID');
  }
}
