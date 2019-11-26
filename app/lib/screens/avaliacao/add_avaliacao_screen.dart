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
  bool _picked = true;


  @override
  Widget build(BuildContext context) {
    var comentario = TextEditingController();
    var cursariaNomamente = TextEditingController();
    var tituloComentario = TextEditingController();
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
              decoration: InputDecoration(labelText: "Comentários"),
              controller: comentario,
            ),
            SizedBox(height: 10,),
            Text("Cursaria Novamente?"),
            RadioButtonGroup(
              orientation: GroupedButtonsOrientation.HORIZONTAL,
              margin: const EdgeInsets.only(left: 12.0),
              onSelected: (String selected) => setState(() {
                _picked = selected == "Sim" ? true : false;
              }),
              labels: <String>[
                "Sim",
                "Não",
              ],
              picked: _picked ? "Sim": "Não",
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
                onPressed: () {},
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
}
