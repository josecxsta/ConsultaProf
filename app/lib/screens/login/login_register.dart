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
    var dataEmissao = MaskedTextController(mask: '00/00/0000');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Data Emissão"),
            controller: dataEmissao,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: RaisedButton(
              child: Text("Cadastrar"),
              color: Colors.cyan,
              onPressed: () async {
                var result = await LoginService().registreLogin(
                    usuario: usuario.text,
                    senha: senha.text,
                    matricula: matricula.text);
                if (result.token.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Container()),
                  );
                }
              },
            ),
          ),
        ],
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
}
