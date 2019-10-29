import 'dart:math';

import 'package:consulta_prof/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  TextEditingController usuario = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  TextEditingController matricula = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  color: Colors.grey,
                  constraints: BoxConstraints(
                      maxHeight: 450.0,
                      maxWidth: 350.0,
                      minWidth: 150.0,
                      minHeight: 150.0),
                  child: Column(
                    children: <Widget>[
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
                      RaisedButton(
                        color: Colors.cyan,
                        onPressed: () async {
                          var result = await LoginService().registreLogin(
                            usuario: usuario.text,
                            senha: senha.text,
                            matricula: matricula.text
                          );
                          if (result.token.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Container()),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
