import 'package:bloc/bloc.dart';
import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_event.dart';
import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_state.dart';
import 'package:consulta_prof/models/avaliacao_model.dart';
import 'package:consulta_prof/services/avaliacoes_service.dart';

class AvaliacoesBloc extends Bloc<AvaliacoesEvent, AvaliacoesState> {
  @override
  AvaliacoesState get initialState => AvaliacoesState.initializing();

  @override
  Stream<AvaliacoesState> mapEventToState(AvaliacoesEvent event) async* {
    if (event is AvaliacoesStartEvent) {
      yield AvaliacoesState.loading();
      var avaliacoes = await _obtenhaAvaliacoes(event.idProfessor);
      yield AvaliacoesState.suceso(avaliacoes);
    }
  }

  Future<List<AvaliacaoModel>> _obtenhaAvaliacoes(int idProfessor) async {
    return await AvaliacoesService().obtenhaAvaliacoes(idProfessor);
  }
}
