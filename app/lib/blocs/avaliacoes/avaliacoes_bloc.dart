import 'package:bloc/bloc.dart';
import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_event.dart';
import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_state.dart';
import 'package:consulta_prof/models/avaliacao_model.dart';

class AvaliacoesBloc extends Bloc<AvaliacoesEvent, AvaliacoesState> {

  @override
  AvaliacoesState get initialState => AvaliacoesState.initializing();

  @override
  Stream<AvaliacoesState> mapEventToState(AvaliacoesEvent event) async* {
    if (event is AvaliacoesStartEvent) {
      yield AvaliacoesState.loading();
      var avaliacoes =_obtenhaAvaliacoes(event.idProfessor);
      yield AvaliacoesState.suceso(avaliacoes);
    }
  }

  List<AvaliacaoModel> _obtenhaAvaliacoes(int idProfessor) {
    var avaliacoes = List<AvaliacaoModel>()
      ..add(
          AvaliacaoModel(mediasNotas: 4.2,
            comentario: "Ótimo professor",
            cursariaNovamente: true,
            idProfesssor: 1,
            notaCoerencia: 5,
            notaDidatica: 4,
            notaGenteBoa: 5,
            notaPontualidade: 5,
            tituloComentario: "Bom professor",))..add(AvaliacaoModel(
        mediasNotas: 4.7,
        comentario: "Ótimo professor",
        cursariaNovamente: true,
        idProfesssor: 1,
        notaCoerencia: 5,
        notaDidatica: 4,
        notaGenteBoa: 5,
        notaPontualidade: 5,
        tituloComentario: "Gente Boa",))..add(AvaliacaoModel(
        mediasNotas: 5.0,
        comentario: "Ótimo professor",
        cursariaNovamente: true,
        idProfesssor: 2,
        notaCoerencia: 5,
        notaDidatica: 4,
        notaGenteBoa: 5,
        notaPontualidade: 5,
        tituloComentario: "Ótimo professor",))..add(AvaliacaoModel(
        mediasNotas: 4.6,
        comentario: "Ótimo professor",
        cursariaNovamente: true,
        idProfesssor: 2,
        notaCoerencia: 5,
        notaDidatica: 4,
        notaGenteBoa: 5,
        notaPontualidade: 5,
        tituloComentario: "Professor legal",));

    return avaliacoes.where((a) => a.idProfesssor == idProfessor).toList();
  }
}