abstract class ProfessoresEvent {}

class ProfessoresStartEvent extends ProfessoresEvent {}

class ProfessoresFiltreEvent extends ProfessoresEvent {
  final String filtro;

  ProfessoresFiltreEvent(this.filtro);
}


class ProfessoresLimpeFiltroEvent extends ProfessoresEvent {}
