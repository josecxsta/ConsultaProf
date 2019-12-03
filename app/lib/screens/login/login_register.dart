import 'dart:math';

import 'package:consulta_prof/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    var usuario = TextEditingController();
    var senha = TextEditingController();
    var matricula = TextEditingController();
    var codigoVerificacao = TextEditingController();
    var email = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Bem-Vindo",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "usuário"),
              controller: usuario,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "senha"),
              controller: senha,
              obscureText: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "matrícula"),
              controller: matricula,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Código Verificação"),
              controller: codigoVerificacao,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "E-mail"),
              controller: email,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: RaisedButton(
                child: Text("Cadastrar"),
                color: Colors.blueAccent,
                onPressed: () async {
                  var result = await _monteShowDialogConfirmacao(context);
                  if (result) {
                    await LoginService().registreLogin(
                        apelido: usuario.text,
                        senha: senha.text,
                        matricula: matricula.text,
                        email: email.text,
                        codigoVerificacao: codigoVerificacao.text);

                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formateData(DateTime data) {
    var dia = data.day.toString().padLeft(2, '0');
    var mes = data.month.toString().padLeft(2, '0');
    return "${dia}${mes}${data.year}";
  }

  Future<DateTime> _obtenhaData() {
    FocusScope.of(context).requestFocus(
        new FocusNode()); // Para manter o foco e não aparecer o teclado
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      locale: Locale('pt'),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(),
          child: child,
        );
      },
    );
  }

  Future _monteShowDialogConfirmacao(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text(
            "Obrigado por ter se cadastrado!\nLogo mais entraremos em contato por e-mail com a confirmação do seu cadastro.",
          ),
          actions: [
            FlatButton(
              child: Text("OK"),
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
