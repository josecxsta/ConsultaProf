import 'dart:async';

import 'package:consulta_prof/functions/error_functions.dart';
import 'package:consulta_prof/models/avaliacao_model.dart';
import 'package:consulta_prof/models/docente_model.dart';
import 'package:consulta_prof/models/login_model.dart';
import 'package:consulta_prof/models/user_model.dart';
import 'package:consulta_prof/services/api_service.dart';
import 'package:consulta_prof/services/api_url_service.dart';


class AvaliacoesService {
  Future<List<AvaliacaoModel>> obtenhaAvaliacoes(int idProfessor) async {
    var url = ApiUrlService().getApi('avaliacoes/$idProfessor');
    var apiResponse = await ApiService().get(url);

    var map = apiResponse as List;
    return mapeieDocentes(map);
  }

  List<AvaliacaoModel> mapeieDocentes(List data) {
    return (data).map((c) {
      var map = c as Map;
      var docente = AvaliacaoModel(
        id: map["id"],
        idDiscente: map["discente"],
        idDocente: map["docente"],
        notaDidatica: map["didatica"],
        notaCoerencia: map["coerencia"],
        notaPontualidade: map["pontualidade"],
        notaDisponibilidade: map["disponivel"],
        comentario: map["comentario"],
        tituloComentario: map["tituloComentario"],
        cursariaNovamente: map["cursariaNovamente"] as bool,
       );
      return docente;
    }).toList(growable: false);
  }

}
