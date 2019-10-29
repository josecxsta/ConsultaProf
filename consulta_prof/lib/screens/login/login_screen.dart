import 'package:consulta_prof/blocs/application/application_bloc.dart';
import 'package:consulta_prof/blocs/application/application_event.dart';
import 'package:consulta_prof/blocs/login/login_bloc.dart';
import 'package:consulta_prof/blocs/login/login_state.dart';
import 'package:consulta_prof/screens/login/login_form.dart';
import 'package:consulta_prof/screens/login/login_logo.dart';
import 'package:consulta_prof/screens/widget_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    var appBloc = BlocProvider.of<ApplicationBloc>(context);

    return Scaffold(
      key: _scaffoldKey,
      body: BlocProvider<LoginBloc>(
        builder: (context) => _loginBloc,
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (context, state) {
            if (state.isSucesso) {
              appBloc.add(
                ApplicationLoginEvent(
                  token: state.login.token,
                ),
              );
            }

            if (state.isErro) {
              WidgetHelper.showError(_scaffoldKey, state.error);
            }
            return _buildLogin();
          },
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Container(
      color: Colors.lightBlue,
      child: ListView(
        children: <Widget>[
          LoginLogo(),
          LoginForm(),
          Center(
            child: Container(

              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[],
                  ),
                  RaisedButton(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginRegister()),
                      );
                    },
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
