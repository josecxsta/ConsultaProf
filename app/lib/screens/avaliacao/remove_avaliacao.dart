import 'package:consulta_prof/services/avaliacoes_service.dart';
import 'package:flutter/material.dart';

class RemoveAvaliacao extends StatefulWidget {
  final int idAvaliacao;

  RemoveAvaliacao(this.idAvaliacao);

  @override
  _RemoveAvaliacaoState createState() => _RemoveAvaliacaoState();
}

class _RemoveAvaliacaoState extends State<RemoveAvaliacao> {
  var email = TextEditingController();
  var motivo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var idAvaliacao = this.widget.idAvaliacao;
    return Scaffold(
      appBar: AppBar(
        title: Text("Denúncia"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "E-mail"),
              controller: email,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Motivo para a denúnica",),
              controller: motivo,
              maxLines: 5,
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
                    await AvaliacoesService().denucieAvaliacao(
                        email.text, idAvaliacao);
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

  Future _monteShowDialogConfirmacao(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text(
            "Você deseja denunciar essa avalição?",
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
