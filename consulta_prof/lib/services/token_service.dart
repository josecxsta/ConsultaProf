import 'dart:async';
import 'dart:io' show Platform;
import 'package:consulta_prof/functions/error_functions.dart';
import 'package:consulta_prof/models/session_model.dart';
import 'package:consulta_prof/services/api_service.dart';
import 'package:consulta_prof/services/api_url_service.dart';
import 'package:meta/meta.dart';

class TokenService {
  static final TokenService _singleton = new TokenService._internal();

  factory TokenService() {
    return _singleton;
  }

  TokenService._internal();

  String _tokenUsuario;
  String _tokenDispositivo;

  Future registreToken({
    @required SessionModel session,
    @required String tokenDispositivo,
  }) async {
    assert(session != null);
    assert(tokenDispositivo != null);

    if (session.tokenUsuario == _tokenUsuario &&
        tokenDispositivo == _tokenDispositivo) {
      return null;
    }

    _tokenUsuario = session.tokenUsuario;
    _tokenDispositivo = tokenDispositivo;

    var url = ApiUrlService().getApi('Tokens/RegistreToken');

    return ApiService().post(url, body: {
      'Token': session.tokenUsuario,
      'TokenDispositivo': tokenDispositivo,
      'TipoDispositivo': Platform.isAndroid ? 'A' : 'I'
    }).then((apiResponse) {
      trateApiException(apiResponse.data);
      return apiResponse;
    });
  }

  Future desregistreToken({
    @required SessionModel session,
    @required String tokenDispositivo,
  }) async {
    var url = ApiUrlService().getApi('Tokens/DesregistreToken');

    return ApiService().post(url, body: {
      'Token': session.tokenUsuario,
      'TokenDispositivo': tokenDispositivo,
    });
  }
}
