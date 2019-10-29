import 'package:consulta_prof/models/session_model.dart';
import 'package:meta/meta.dart';

class ApplicationState {
  final bool isInitializing;
  final bool isLoading;
  final bool isAuthenticated;
  final SessionModel session;

  ApplicationState({
    @required this.isInitializing,
    @required this.isLoading,
    @required this.isAuthenticated,
    @required this.session,
  });

  factory ApplicationState.initializing() {
    return ApplicationState(
      isInitializing: true,
      isLoading: false,
      isAuthenticated: false,
      session: null,
    );
  }

  factory ApplicationState.authenticated({
    @required SessionModel session,
  }) {
    assert(session != null);
    return ApplicationState(
      isInitializing: false,
      isLoading: false,
      isAuthenticated: true,
      session: session,
    );
  }

  factory ApplicationState.unauthenticated() {
    return ApplicationState(
      isInitializing: false,
      isLoading: false,
      isAuthenticated: false,
      session: null,
    );
  }

  factory ApplicationState.loading() {
    return ApplicationState(
      isInitializing: false,
      isLoading: true,
      isAuthenticated: false,
      session: null,
    );
  }

  @override
  String toString() {
    return 'ApplicationState{isInitializing: $isInitializing, isLoading: $isLoading, isAuthenticated: $isAuthenticated, session: $session}';
  }
}
