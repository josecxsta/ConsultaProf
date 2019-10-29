import 'package:flutter/cupertino.dart';

abstract class AvaliacoesEvent {}

class AvaliacoesStartEvent extends AvaliacoesEvent {
  final int idProfessor;

  AvaliacoesStartEvent({@required this.idProfessor});
}