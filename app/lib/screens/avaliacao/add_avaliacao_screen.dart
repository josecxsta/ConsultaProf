import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class AddAvaliacao extends StatefulWidget {
  final int idProfesssor;

  AddAvaliacao(int this.idProfesssor);

  @override
  _AddAvaliacaoState createState() => _AddAvaliacaoState();
}

class _AddAvaliacaoState extends State<AddAvaliacao> {
  double notaCoerencia = 0;
  double notaDidatica = 0;
  double notaGenteBoa = 0;
  double notaPontualidade = 0;
  int starCount = 5;

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
              decoration: InputDecoration(labelText: "Cursaria novamente?"),
              controller: cursariaNomamente,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Comentários"),
              controller: comentario,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Nota Coerênica"),
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
            Text("Nota Didática"),
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
            Text("Nota Gente Boa"),
            StarRating(
              size: 25.0,
              rating: notaGenteBoa,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                () {
                  this.notaGenteBoa = rating;
                },
              ),
            ),
            Text("Nota Pontualidade"),
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
