import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_bloc.dart';
import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_event.dart';
import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_state.dart';
import 'package:consulta_prof/blocs/login/login_bloc.dart';
import 'package:consulta_prof/models/repositories/user_repository.dart';
import 'package:consulta_prof/screens/avaliacao/add_avaliacao_screen.dart';
import 'package:consulta_prof/screens/avaliacao/avaliacao_screen.dart';
import 'package:consulta_prof/screens/carregando_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvaliacoesScreen extends StatefulWidget {
  final int idProfessor;

  const AvaliacoesScreen({this.idProfessor});

  @override
  _AvaliacoesScreenState createState() => _AvaliacoesScreenState();
}

class _AvaliacoesScreenState extends State<AvaliacoesScreen> {
  LoginBloc _bloc;

  AvaliacoesBloc _avaliacoesBloc;

  @override
  void initState() {
    super.initState();
    _avaliacoesBloc = AvaliacoesBloc();
    _avaliacoesBloc.add(AvaliacoesStartEvent(idProfessor: widget.idProfessor));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AvaliacoesBloc>(
      builder: (context) => _avaliacoesBloc,
      child: BlocBuilder<AvaliacoesBloc, AvaliacoesState>(
        bloc: _avaliacoesBloc,
        builder: (context, state) {
          if (state.isInitializing || state.isLoading) {
            return CarregandoWidget();
          }
          var avaliacoes = state.avaliacoes;
          var idProfessor = avaliacoes.first.idDiscente;
          return Scaffold(
            appBar: AppBar(
              title: Text("Avaliações"),
            ),
            body: Container(
              child: ListView.builder(
                itemCount: avaliacoes.length,
                itemBuilder: (context, index) {
                  var notaMedia = (avaliacoes[index].notaCoerencia +
                          avaliacoes[index]?.notaPontualidade +
                          avaliacoes[index]?.notaDidatica +
                          avaliacoes[index]?.notaDisponibilidade) /
                      4;
                  return Container(
                    height: 90,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(5.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AvaliacaoScreen(avaliacoes[index])),
                        );
                      },
                      color: Colors.white70,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        width: double.infinity,
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Média: ${avaliacoes[index].tituloComentario}",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              notaMedia.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            floatingActionButton: UserRepository().load().id == 0
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAvaliacao(idProfessor)),
                        );
                      },
                      icon: Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
