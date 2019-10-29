import 'package:bloc/bloc.dart';
import 'package:consulta_prof/blocs/professores/professores_event.dart';
import 'package:consulta_prof/blocs/professores/professores_state.dart';
import 'package:consulta_prof/models/professor_model.dart';

class ProfessoresBloc extends Bloc<ProfessoresEvent, ProfessoresState> {
  @override
  ProfessoresState get initialState => ProfessoresState.initializing();

  @override
  Stream<ProfessoresState> mapEventToState(ProfessoresEvent event) async* {
    if (event is ProfessoresStartEvent) {
      yield ProfessoresState.loading();
      var professores = _obtenhaProfessores();
      yield ProfessoresState.loaded(professores);
      return;
    }

    if(event is ProfessoresFiltreEvent) {
      yield state.filtreProfessores(event.filtro);
      return;
    }

    if(event is ProfessoresLimpeFiltroEvent) {
      yield state.limpeFiltro();
      return;
    }
  }

  List<ProfessorModel> _obtenhaProfessores() {
    return List<ProfessorModel>()
      ..add(ProfessorModel(id: 1, nome: 'João Zaffari',),)..add(
        ProfessorModel(id: 2, nome: 'Leticia Brandão',),);
  }

}