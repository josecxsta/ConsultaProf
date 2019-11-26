import 'package:consulta_prof/models/avaliacao_model.dart';
import 'package:consulta_prof/screens/avaliacao/remove_avaliacao.dart';
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
              style: TextStyle(fontSize: 26),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Comentáro: ${avaliacao.comentario}",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            color: Colors.grey,
            height: 0.8,
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            "Cursaria Novamente: ${avaliacao.cursariaNovamente ? "Sim" : "Não"}",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            color: Colors.grey,
            height: 0.8,
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            "Disponibilidade: ${avaliacao.notaDisponibilidade.toString()} (0 à 5)",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            color: Colors.grey,
            height: 0.8,
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            "Didática: ${avaliacao.notaDidatica.toString()} (0 à 5)",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            color: Colors.grey,
            height: 0.8,
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            "Pontualidade: ${avaliacao.notaPontualidade.toString()} (0 à 5)",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            color: Colors.grey,
            height: 0.8,
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            "Coerência: ${avaliacao.notaCoerencia.toString()} (0 à 5)",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            color: Colors.grey,
            height: 0.8,
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RemoveAvaliacao(this.widget.avaliacao.id)),
            );
          },
          icon: Icon(
            Icons.flag,
            color: Colors.red,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
