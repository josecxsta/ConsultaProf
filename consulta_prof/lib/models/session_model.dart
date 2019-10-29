import 'package:consulta_prof/models/user_model.dart';
import 'package:meta/meta.dart';

class SessionModel {
  final UserModel user;
  final String tokenUsuario;
  final String dominio;

  SessionModel({
    @required this.tokenUsuario,
    @required this.user,
    @required this.dominio,
  })  : assert(tokenUsuario != null),
        assert(user != null),
        assert(dominio != null);

  SessionModel altereToken(String token) {
    return SessionModel(
      tokenUsuario: token,
      user: this.user,
      dominio: this.dominio,
    );
  }
}
