import 'package:consulta_prof/blocs/professores/professores_bloc.dart';
import 'package:consulta_prof/screens/avaliacoes/avaliacoes_screen.dart';
import 'package:flutter/material.dart';

class ProfessoresListWidget extends StatefulWidget {
  final ProfessoresBloc bloc;

  const ProfessoresListWidget({this.bloc});

  @override
  _ProfessoresListWidgetState createState() => _ProfessoresListWidgetState();
}

class _ProfessoresListWidgetState extends State<ProfessoresListWidget> {
  @override
  Widget build(BuildContext context) {
    var professores = widget.bloc.state.professoresFiltrados;
    return ListView.builder(
      itemCount: professores.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(professores[index].nome),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AvaliacoesScreen(
                idProfessor: professores[index].id,
              ),
            ),
          ),
        );
      },
    );
  }
}
