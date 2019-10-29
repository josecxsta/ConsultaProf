import 'package:consulta_prof/models/user_model.dart';
import 'package:meta/meta.dart';

class LoginModel {
  final UserModel user;
  final String token;

  LoginModel({
    @required this.user,
    @required this.token,
  });
}