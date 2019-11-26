import 'dart:async';

import 'package:consulta_prof/functions/error_functions.dart';
import 'package:consulta_prof/models/docente_model.dart';
import 'package:consulta_prof/models/login_model.dart';
import 'package:consulta_prof/models/user_model.dart';
import 'package:consulta_prof/services/api_service.dart';
import 'package:consulta_prof/services/api_url_service.dart';


class DocenteService {
  Future<List<DocenteModel>> obtenhaDocentes() async {
    var url = ApiUrlService().getApi('docentes');
    var apiResponse = await ApiService().get(url);

    var map = apiResponse as List;
    return mapeieDocentes(map);
  }

  List<DocenteModel> mapeieDocentes(List data) {
    return (data).map((c) {
      var map = c as Map;
      var docente = DocenteModel(
        id: map["id"],
        nome: map['nome'],
      );
      return docente;
    }).toList(growable: false);
  }

}
