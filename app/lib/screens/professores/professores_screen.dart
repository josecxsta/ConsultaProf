import 'package:consulta_prof/blocs/professores/professores_bloc.dart';
import 'package:consulta_prof/blocs/professores/professores_event.dart';
import 'package:consulta_prof/screens/carregando_widget.dart';
import 'package:consulta_prof/screens/professores/profesores_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:consulta_prof/blocs/professores/professores_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfessoresScreen extends StatefulWidget {
  @override
  _ProfessoresScreenState createState() => _ProfessoresScreenState();
}

class _ProfessoresScreenState extends State<ProfessoresScreen> {
  ProfessoresBloc _professoresBloc;
  TextEditingController _controllerPesquisa = TextEditingController();


  @override
  void initState() {
    super.initState();
    _professoresBloc = ProfessoresBloc();
    _professoresBloc.add(ProfessoresStartEvent());

    _controllerPesquisa.addListener(() {
      _professoresBloc.add(ProfessoresFiltreEvent(_controllerPesquisa.text,),);
    },);
  }

  @override
  void dispose() {
    _professoresBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfessoresBloc>(
        builder: (context) => _professoresBloc,
        child: BlocBuilder<ProfessoresBloc, ProfessoresState>(
          bloc: _professoresBloc,
          builder: (context, state) {
            if (state.isInitializing) {
              return CarregandoWidget();
            }

            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: Text("Professores"),
              ),
              body: _buildProfessores(),

            );
          },
        )
    );
  }

  Widget _buildProfessores() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: TextField(
            controller: _controllerPesquisa,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Procurar contato",
              prefixIcon: Icon(
                Icons.search,
                size: 15,
              ),
              suffixIcon: _buildButtonClose(),
            ),
          ),
        ),
        Expanded(
          child: ProfessoresListWidget(bloc: _professoresBloc),
        ),
      ],
    );
  }

  IconButton _buildButtonClose() {
    return IconButton(
      icon: Icon(
        Icons.close,
        size: 15,
      ),
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback(
                (_) => _controllerPesquisa.clear());
      },
    );
  }
}
