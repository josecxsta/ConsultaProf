import 'package:consulta_prof/models/avaliacao_model.dart';
import 'package:flutter/cupertino.dart';

abstract class AvaliacoesEvent {}

class AvaliacoesStartEvent extends AvaliacoesEvent {
  final int idProfessor;

  AvaliacoesStartEvent({@required this.idProfessor});
}

class AvaliacoesAddEvent extends AvaliacoesEvent {
  final AvaliacaoModel avaliacao;

  AvaliacoesAddEvent({@required this.avaliacao});
}