import 'dart:io';

import 'package:consulta_prof/services/file_service.dart';

class UtilidadesRepository {
  Future deleteAllFilesInCache() async {
    var localPath = await FileService().getLocalPath();
    var files = Directory(localPath).listSync(recursive: false).toList();
    files.removeWhere((file)
    {
      return
      (
        file.path == "$localPath/res_timestamp-1-1567776480513"
        || file.path == "$localPath/flutter_assets"
      );
    });
    files.forEach((file) => file.deleteSync(recursive: true));
  }
}
