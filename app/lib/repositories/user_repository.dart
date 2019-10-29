import 'dart:io';


import 'dart:convert';

import 'package:consulta_prof/models/user_model.dart';
import 'package:consulta_prof/services/file_service.dart';

class UserRepository {
  static UserModel _cache;

  Future<String> _getFileName() async {
    return FileService().getLocalPath().then((path) => '$path/user.json');
  }


  Future<UserModel> load() async {
    if (_cache != null) {
      return _cache;
    }

    var fileName = await _getFileName();
    var arquivo = File(fileName);
    if (!arquivo.existsSync()) {
      return null;
    }
    var content = arquivo.readAsStringSync();
    var decoded = json.decode(content);
    return _cache;
  }

  Future<void> persist(UserModel userModel) async {
    _cache = userModel;
    return _getFileName().then((fileName) {
      File(fileName).openWrite(mode: FileMode.writeOnly).write(userModel);
    });
  }

  void limpeCache(){
    _cache = null;
  }
}