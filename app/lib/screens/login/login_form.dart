import 'package:consulta_prof/blocs/login/login_bloc.dart';
import 'package:consulta_prof/blocs/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'login_register.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _usuarioController = new TextEditingController();
  final _senhaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginBloc = BlocProvider.of<LoginBloc>(context);
    Widget widget;
    if(loginBloc.state.isCarregando) {
      widget = CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        strokeWidth: 1,
      );
    }
    else {
      widget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 110, right: 100),
            child: Text(
              'Login',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15),
            ),
          ),
          Align(
            heightFactor: 0,
            widthFactor: 0,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          )
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Olá!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Faça o login para continuar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _usuarioController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(1),
                labelText: "Email or Username",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
                suffixIcon: Icon(Icons.person_outline),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _senhaController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(1),
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                suffixIcon: Icon(Icons.lock_outline),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.2,
              color: Colors.white,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: widget,
                onPressed: () => _onLoginButtonPressed(loginBloc)
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onLoginButtonPressed(LoginBloc loginBloc) {
    loginBloc.add(LoginButtonPressedEvent(
      senha: _senhaController.text,
      login: _usuarioController.text,
    ));
  }
}
