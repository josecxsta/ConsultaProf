import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:consulta_prof/functions/error_functions.dart';
import 'package:consulta_prof/models/session_model.dart';
import 'package:consulta_prof/models/user_model.dart';
import 'package:consulta_prof/repositories/token_repository.dart';
import 'package:consulta_prof/repositories/ultilidades_repository.dart';
import 'package:consulta_prof/repositories/user_repository.dart';
import 'package:consulta_prof/services/docentes_service.dart';
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
  }

  Stream<ApplicationState> _inicializeAplicacao(String token) async* {

    var session = SessionModel(
      tokenUsuario: token,
      user: UserModel(nome: "Gustavo Henrique", id: 1),
    );
    ApplicationState.unauthenticated();

//    try {
//      await _carregueDados(session);
//    } catch (error, stackTrace) {
//      yield ApplicationState.unauthenticated();
//      if (!ehErroDeTimeoutNaConexao(error)) {
//        reportError(error, stackTrace);
//        return;
//      }
//    }

    yield ApplicationState.authenticated(
    );
    return;
  }

  Future _carregueDados(SessionModel session) async {
    var docentes = await DocenteService().obtenhaDocentes();
  }
}
