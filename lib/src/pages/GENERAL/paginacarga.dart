import 'dart:async';

import 'package:flutter/material.dart';

class Paginadecarga extends StatefulWidget {
  Paginadecarga({Key key}) : super(key: key);

  @override
  _PaginadecargaState createState() => _PaginadecargaState();
}

class _PaginadecargaState extends State<Paginadecarga> {
  _PaginadecargaState() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        Navigator.pushNamed(context, "homehuesped");
        
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
