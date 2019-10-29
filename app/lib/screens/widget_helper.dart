import 'package:flutter/material.dart';

class WidgetHelper {
  static AppBar appBar(String texto, List<Widget> actions) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          texto,
          style: TextStyle(
            fontFamily: 'Comfortaa',
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  static void showError(GlobalKey<ScaffoldState> key, String errorMessage) {
    _onWidgetDidBuild(() {
      key.currentState.showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  static void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}