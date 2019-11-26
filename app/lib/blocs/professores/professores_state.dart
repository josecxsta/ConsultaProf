import 'package:consulta_prof/models/docente_model.dart';

class ProfessoresState {
  final bool isInitializing;
  final bool isLoading;
  final List<DocenteModel> professores;
  final String filtro;

  ProfessoresState({
    this.isInitializing,
    this.isLoading,
    this.professores,
    this.filtro,
  });

  List<DocenteModel> get professoresFiltrados {
    if (filtro.isEmpty) {
      return professores;
    }
    return professores.where((c) => c.nome.toLowerCase().startsWith(filtro)).toList();
  }

  factory ProfessoresState.initializing() {
    return ProfessoresState(
      isInitializing: true,
      filtro: "",
    );
  }

  factory ProfessoresState.loading() {
    return ProfessoresState(
      isLoading: true,
      filtro: "",
    );
  }

  factory ProfessoresState.loaded(List<DocenteModel> professores) {
    return ProfessoresState(
      isInitializing: false,
      isLoading: false,
      professores: professores,
      filtro: "",
    );
  }

  ProfessoresState _copyWith({
    bool isInitializing,
    bool isLoading,
    Iterable<DocenteModel> professores,
    String filtro,
  }) {
    return ProfessoresState(
      isInitializing: isInitializing ?? this.isInitializing,
      isLoading: isLoading ?? this.isLoading,
      professores: professores ?? this.professores,
      filtro: filtro ?? this.filtro,
    );
  }

  ProfessoresState filtreProfessores(String filtro) {
    return this._copyWith(filtro: filtro);
  }

  ProfessoresState limpeFiltro() {
    return this._copyWith(filtro: "");
  }
}
