import 'dart:async';

import 'package:flutter/material.dart';

class Paginadecarga1 extends StatefulWidget {
  Paginadecarga1({Key key}) : super(key: key);

  @override
  _Paginadecarga1State createState() => _Paginadecarga1State();
}

class _Paginadecarga1State extends State<Paginadecarga1> {
  _Paginadecarga1State() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        Navigator.pushNamed(context, "afterlogin");
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green))),
    );
  }
}
