import 'dart:async';

import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  _LoadingState() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        Navigator.pushNamed(context, "fotocedula");
        
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
