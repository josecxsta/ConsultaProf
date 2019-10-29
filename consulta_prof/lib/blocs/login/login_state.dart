import 'package:consulta_prof/models/login_model.dart';
import 'package:meta/meta.dart';

class LoginState  {
  final bool isInicializando;
  final bool isCarregando;
  final bool isSucesso;
  final bool isErro;
  final String error;
  final LoginModel login;

  LoginState({
    @required this.isInicializando,
    @required this.isCarregando,
    @required this.isSucesso,
    @required this.isErro,
    @required this.error,
    @required this.login,
  })  : assert(isInicializando != null),
        assert(isCarregando != null),
        assert(isSucesso != null),
        assert(isErro != null);

  factory LoginState.initial() {
    return LoginState(
      isInicializando: true,
      isCarregando: false,
      isSucesso: false,
      isErro: false,
      error: null,
      login: null,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isInicializando: false,
      isCarregando: true,
      isSucesso: false,
      isErro: false,
      error: null,
      login: null,
    );
  }

  factory LoginState.failure(String error) {
    assert(error != null);
    return LoginState(
      isInicializando: false,
      isCarregando: false,
      isSucesso: false,
      isErro: true,
      error: error,
      login: null,
    );
  }

  factory LoginState.success(LoginModel login) {
    assert(login != null);
    return LoginState(
      isInicializando: false,
      isCarregando: false,
      isSucesso: true,
      isErro: false,
      error: null,
      login: login,
    );
  }

  @override
  List<Object> get props => [isInicializando, isCarregando, isSucesso, isErro, error];
}
