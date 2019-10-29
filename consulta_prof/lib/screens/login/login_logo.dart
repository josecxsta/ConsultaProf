import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      child: ClipPath(
        clipper: HeaderColor(),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Image(
//                height: MediaQuery.of(context).size.height * 0.25,
//                image: AssetImage('assets/flutterlogo.png'),
//              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'ConsultaProf',
                style: TextStyle(
                  letterSpacing: 5,
                  color: Colors.grey,
                  fontSize: 43,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderColor extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
