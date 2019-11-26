import 'dart:async';

import 'package:consulta_prof/models/avaliacao_model.dart';
import 'package:consulta_prof/services/api_service.dart';
import 'package:consulta_prof/services/api_url_service.dart';

class AvaliacoesService {
  Future<List<AvaliacaoModel>> obtenhaAvaliacoes(int idProfessor) async {
    var url = ApiUrlService().getApi('avaliacoes/$idProfessor');
    var apiResponse = await ApiService().get(url);

    var map = apiResponse as List;
    return mapeieDocentes(map);
  }

  Future adicioneAvaliacao(AvaliacaoModel avaliacao) async {
    var url = ApiUrlService().getApi('avaliacoes');
    var apiResponse = await ApiService().post(
      url,
      body: {
        "discente": 1,
        "docente": avaliacao.idDocente,
        "didatica": avaliacao.notaDidatica,
        "coerencia": avaliacao.notaCoerencia,
        "pontualidade": avaliacao.notaPontualidade,
        "comentario": "${avaliacao.comentario}",
        "tituloComentario": "${avaliacao.tituloComentario}",
        "cursariaNovamente": "${avaliacao.cursariaNovamente}",
        "disponivel": avaliacao.notaDisponibilidade
      },
    );
  }

  Future removeAvaliacao(String email, int idAvaliacao) async {
    var url = ApiUrlService().getApi('denuncias/$idAvaliacao');
    var apiResponse = await ApiService().post(
      url,
      body: {
        "email": "$email",
      },
    );
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
