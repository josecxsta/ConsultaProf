import 'package:bloc/bloc.dart';
import 'package:consulta_prof/blocs/professores/professores_event.dart';
import 'package:consulta_prof/blocs/professores/professores_state.dart';
import 'package:consulta_prof/models/docente_model.dart';
import 'package:consulta_prof/services/docentes_service.dart';

class ProfessoresBloc extends Bloc<ProfessoresEvent, ProfessoresState> {
  @override
  ProfessoresState get initialState => ProfessoresState.initializing();

  @override
  Stream<ProfessoresState> mapEventToState(ProfessoresEvent event) async* {
    if (event is ProfessoresStartEvent) {
      yield ProfessoresState.loading();
      var professores = await _obtenhaProfessores();
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

  Future<List<DocenteModel>> _obtenhaProfessores() async {
    var docentes = await DocenteService().obtenhaDocentes();
    return docentes;
  }

}