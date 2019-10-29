import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

abstract class ApplicationEvent {}

class ApplicationStartEvent extends ApplicationEvent {
  final BuildContext context;
  ApplicationStartEvent({@required this.context});
}

class ApplicationLoginEvent extends ApplicationEvent {
  final String token;

  ApplicationLoginEvent({@required this.token});
}

class ApplicationLogoutEvent extends ApplicationEvent {
  @override
  String toString() => 'Logout';
}

class ApplicationAlteracaoSenhaEvent extends ApplicationEvent {
  final String novoToken;

  ApplicationAlteracaoSenhaEvent({@required this.novoToken});
}
