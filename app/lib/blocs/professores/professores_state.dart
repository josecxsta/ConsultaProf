import 'package:consulta_prof/models/professor_model.dart';

class ProfessoresState {
  final bool isInitializing;
  final bool isLoading;
  final List<ProfessorModel> professores;
  final String filtro;

  ProfessoresState({
    this.isInitializing,
    this.isLoading,
    this.professores,
    this.filtro,
  });


  List<ProfessorModel> _apliqueFiltroProfessores(
      List<ProfessorModel> professores) {
    return filtro.isEmpty ? professores : professores.where((c) => c.nome.toUpperCase().startsWith((filtro.toUpperCase())));
  }

  factory ProfessoresState.initializing() {
    return ProfessoresState(
      isInitializing: true,
    );
  }

  factory ProfessoresState.loading() {
    return ProfessoresState(
      isLoading: true,
    );
  }

  factory ProfessoresState.loaded(List<ProfessorModel> professores) {
    return ProfessoresState(
      isInitializing: false,
      isLoading: false,
      professores: professores
    );
  }

  ProfessoresState _copyWith({
    bool isInitializing,
    bool isLoading,
    Iterable<ProfessorModel> professores,
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
