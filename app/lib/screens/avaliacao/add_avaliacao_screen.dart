import 'package:consulta_prof/models/avaliacao_model.dart';
import 'package:consulta_prof/services/avaliacoes_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class AddAvaliacao extends StatefulWidget {
  final int idProfesssor;

  AddAvaliacao(int this.idProfesssor);

  @override
  _AddAvaliacaoState createState() => _AddAvaliacaoState();
}

class _AddAvaliacaoState extends State<AddAvaliacao> {
  double notaCoerencia = 0;
  double notaDidatica = 0;
  double notaDisponibilidade = 0;
  double notaPontualidade = 0;
  int starCount = 5;
  bool cursariaNovamente = true;
  var comentario = TextEditingController();
  var cursariaNomamente = TextEditingController();
  var tituloComentario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final idProfesor = this.widget.idProfesssor;

    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Avaliação"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Cometário Geral"),
              controller: tituloComentario,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Comentário Detalhado"),
              controller: comentario,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Cursaria Novamente?"),
            RadioButtonGroup(
              orientation: GroupedButtonsOrientation.HORIZONTAL,
              margin: const EdgeInsets.only(left: 12.0),
              onSelected: (String selected) => setState(() {
                cursariaNovamente = selected == "Sim" ? true : false;
              }),
              labels: <String>[
                "Sim",
                "Não",
              ],
              picked: cursariaNovamente ? "Sim" : "Não",
              itemBuilder: (Radio rb, Text txt, int i) {
                return Row(
                  children: <Widget>[
                    rb,
                    txt,
                  ],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("Coerênica na explicação das matérias"),
            StarRating(
              size: 25.0,
              rating: notaCoerencia,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                () {
                  this.notaCoerencia = rating;
                },
              ),
            ),
            Text("Didática"),
            StarRating(
              size: 25.0,
              rating: notaDidatica,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                () {
                  this.notaDidatica = rating;
                },
              ),
            ),
            Text("Disponibilidade fora da sala de aula"),
            StarRating(
              size: 25.0,
              rating: notaDisponibilidade,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                () {
                  this.notaDisponibilidade = rating;
                },
              ),
            ),
            Text("Pontualidade"),
            StarRating(
              size: 25.0,
              rating: notaPontualidade,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                () {
                  this.notaPontualidade = rating;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              width: 70,
              child: FlatButton(
                onPressed: () async {
                  var result = await _monteShowDialogConfirmacao(context);
                  if (result) {
                    await _adicionaAvaliacao();
                    Navigator.pop(context);
                  }
                },
                color: Colors.blue,
                child: Text(
                  "Confirmar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _adicionaAvaliacao() async {
    var avaliacao = AvaliacaoModel(
      cursariaNovamente: cursariaNovamente,
      tituloComentario: tituloComentario.text,
      comentario: comentario.text,
      notaPontualidade: notaPontualidade.toInt(),
      notaCoerencia: notaCoerencia.toInt(),
      notaDidatica: notaDidatica.toInt(),
      notaDisponibilidade: notaDisponibilidade.toInt(),
      idDocente: this.widget.idProfesssor,
    );

    await AvaliacoesService().adicioneAvaliacao(avaliacao);
  }

  Future _monteShowDialogConfirmacao(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text(
            "Você deseja adicionar essa avalição para o professor?",
          ),
          actions: [
            FlatButton(
              child: Text("NÃO"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              child: Text("SIM"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }
}
