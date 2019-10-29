import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_bloc.dart';
import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_event.dart';
import 'package:consulta_prof/blocs/avaliacoes/avaliacoes_state.dart';
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
          return Scaffold(
            appBar: AppBar(
              title: Text("Avaliações"),
            ),
            body: Container(
              child: ListView.builder(
                itemCount: avaliacoes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Text(avaliacoes[index].tituloComentario),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            avaliacoes[index].mediasNotas.toString(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
