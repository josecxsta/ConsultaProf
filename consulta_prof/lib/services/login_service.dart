import 'dart:async';

import 'package:consulta_prof/functions/error_functions.dart';
import 'package:consulta_prof/models/login_model.dart';
import 'package:consulta_prof/models/user_model.dart';

import 'api_service.dart';
import 'api_url_service.dart';

class LoginService {
  Future<LoginModel> realizeLogin(String usuario, String senha) async {
//    var url = ApiUrlService().getApi('Login/RealizeLogin');
//    var apiResponse = await ApiService().post(
//      url,
//      body: {
//        "Login": usuario,
//        "Senha": senha,
//      },
//    );
//
//    var map = apiResponse.data as Map;
//    trateApiException(map);
//    return _mapeieLoginModel(map);
  return LoginModel(user: UserModel(nome: "Gustavo Henrique", id: 1), token: "d4fgas");
  }

  Future<LoginModel> registreLogin({String usuario, String senha, String matricula, }) async {
    return LoginModel(user: UserModel(nome: "Gustavo Henrique", id: 1), token: "d4fgas");
  }

  LoginModel _mapeieLoginModel(Map map) {
    return LoginModel(
      token: map['Result']['token'],
      user: UserModel(
        id: map['Result']['idu'],
        nome: map['Result']['nom'],
      ),
    );
  }

}
