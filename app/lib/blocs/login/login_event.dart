import 'package:meta/meta.dart';


abstract class LoginEvent { }

class LoginButtonPressedEvent extends LoginEvent {
  final String login;
  final String senha;

  LoginButtonPressedEvent({@required this.login, @required this.senha});

  @override
  String toString() =>
      'LoginButtonPressed { username: $login, password: $senha }';
}

class LoginLoggedEvent extends LoginEvent {}


