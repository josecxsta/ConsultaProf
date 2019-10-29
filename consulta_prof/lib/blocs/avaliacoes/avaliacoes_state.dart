import 'package:consulta_prof/models/avaliacao_model.dart';

class AvaliacoesState {
  final bool isInitializing;
  final bool isSusesso;
  final bool isLoading;
  final List<AvaliacaoModel> avaliacoes;

  AvaliacoesState({
    this.isInitializing,
    this.isLoading,
    this.isSusesso,
    this.avaliacoes,
  });

  factory AvaliacoesState.initializing() {
    return AvaliacoesState(
      isInitializing: true,
      isLoading: false,
      isSusesso: false,
      avaliacoes: null,
    );
  }

  factory AvaliacoesState.loading() {
    return AvaliacoesState(
        isInitializing: false,
        isLoading: true,
        isSusesso: false,
        avaliacoes: null,
    );
  }

  factory AvaliacoesState.suceso(List<AvaliacaoModel> avaliacoes) {
    return AvaliacoesState(
      isInitializing: false,
      isLoading: false,
      isSusesso: true,
      avaliacoes: avaliacoes,
    );
  }
}
