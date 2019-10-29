import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:consulta_prof/functions/error_functions.dart';
import 'package:consulta_prof/models/session_model.dart';
import 'package:consulta_prof/repositories/token_repository.dart';
import 'package:consulta_prof/repositories/ultilidades_repository.dart';
import 'package:consulta_prof/repositories/user_repository.dart';
import 'package:consulta_prof/services/token_service.dart';

import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  @override
  ApplicationState get initialState => ApplicationState.initializing();

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartEvent) {
      var token = await TokenRepository().getToken();
      if (token == null) {
        yield ApplicationState.unauthenticated();
      } else {
        yield* _inicializeAplicacao(token);
      }

      return;
    }

    if (event is ApplicationLoginEvent) {
      TokenRepository().persistToken(event.token);
      yield* _inicializeAplicacao(event.token);
      return;
    }

    if (event is ApplicationLogoutEvent) {
      if (await TokenRepository().hasDeviceToken()) {
        TokenService().desregistreToken(
          session: state.session,
          tokenDispositivo: await TokenRepository().getDeviceToken(),
        );
      }

      TokenRepository().deleteTokens();
      UtilidadesRepository().deleteAllFilesInCache();
      UserRepository().limpeCache();
      yield ApplicationState.unauthenticated();
      return;
    }

    if (event is ApplicationAlteracaoSenhaEvent) {
      TokenRepository().persistToken(event.novoToken);
      yield* _inicializeAplicacao(event.novoToken);
      return;
    }
  }

  Stream<ApplicationState> _inicializeAplicacao(String token) async* {
    var user = await UserRepository().load();

    if (user == null) {
      yield ApplicationState.unauthenticated();
      return;
    }

    var session = SessionModel(
      tokenUsuario: token,
      user: user,
    );

    try {
      await _carregueDados(session);
    } catch (error, stackTrace) {
      yield ApplicationState.unauthenticated();
      if (!ehErroDeTimeoutNaConexao(error)) {
        reportError(error, stackTrace);
        return;
      }
    }

    yield ApplicationState.authenticated(
      session: session,
    );
  }

  Future _carregueDados(SessionModel session) async {}
}
