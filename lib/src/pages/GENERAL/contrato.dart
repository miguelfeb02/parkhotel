import 'package:flutter/material.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';

class Contrato extends StatefulWidget {
  @override
  _ContratoState createState() => _ContratoState();
}

class _ContratoState extends State<Contrato> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Contrato de hospedaje',
            style: TextStyle(fontFamily: "evel"),
          ),
        ),
        body: Container(
            child:pre.idioma? ListView(
          children: [
            Image(
              image: AssetImage('recursos/contrato1.jpg'),
            ),
            SizedBox(
              height: 10,
            ),
            Image(
              image: AssetImage('recursos/contrato2.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato3.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato4.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato5.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato6.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato7.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato51.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato8.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato9.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato10.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato11.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato12.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato13.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato14.jpg'),
            ),
            Image(
              image: AssetImage('recursos/contrato15.jpg'),
            ),
          ],
        ):ListView(
          children: [
            Image(
              image: AssetImage('recursos/ci1.jpg'),
            ),
            SizedBox(
              height: 10,
            ),
            Image(
              image: AssetImage('recursos/ci2.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci3.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci31.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci4.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci5.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci6.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci7.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci8.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci9.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci10.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci11.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci12.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci13.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci14.jpg'),
            ),
            Image(
              image: AssetImage('recursos/ci15.jpg'),
            ),
          ],
        ),
        ));
  }
}
