import 'package:consulta_prof/models/avaliacao_model.dart';
import 'package:flutter/material.dart';

class AvaliacaoScreen extends StatefulWidget {
  final AvaliacaoModel avaliacao;

  AvaliacaoScreen(this.avaliacao);

  @override
  _AvaliacaoScreenState createState() => _AvaliacaoScreenState();
}

class _AvaliacaoScreenState extends State<AvaliacaoScreen> {
  @override
  Widget build(BuildContext context) {
    var avaliacao = this.widget.avaliacao;
    return Scaffold(
      appBar: AppBar(
        title: Text("Avaliação"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Center(
            child: Text(
              avaliacao.tituloComentario,
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Comentáro: ${avaliacao.comentario}",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Cursaria Novamente: ${avaliacao.cursariaNovamente ? "Sim" : "Não"}",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Disponibilidade: ${avaliacao.notaDisponibilidade.toString()}",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Didática: ${avaliacao.notaDidatica.toString()}",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Pontualidade: ${avaliacao.notaPontualidade.toString()}",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Coerência: ${avaliacao.notaCoerencia.toString()}",
          ),
        ],
      ),
    );
  }
}
