

import 'package:flutter/material.dart';
import 'package:parkhotel/src/models/comodel.dart';
import 'package:parkhotel/src/models/encmodel.dart';
import 'package:parkhotel/src/providers/checkin_provider.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';

class Checkout extends StatefulWidget {
  @override
  CheckoutState createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  Checkoutmodel checkout = new Checkoutmodel();
  Encmodel encm = new Encmodel();
  final checkinprovider = CheckinProvider();
  String nombre;
  String correo;
  String fechaent;
  String id = "";
  String cedula;
  String celular;
  String asterisco = "*";
  bool validator1 = false;
  bool validator2 = false;
  bool validator3 = false;
  bool validator4 = false;
  bool validator5 = false;
  bool validator6 = false;
  bool validator7 = false;
  bool validator8 = false;
  bool validator9 = false;
  bool validator10 = false;
  bool validator11 = false;
  bool validator12 = false;
  bool validator13 = false;
  bool validator14 = false;
  bool validator15 = false;
  int respuesta1;
  int respuesta2;
  int respuesta3;
  int respuesta4;
  int respuesta5;
  int respuesta6;
  int respuesta7;
  int respuesta8;
  int respuesta9;
  int respuesta10;
  int respuesta11;
  int respuesta12;
  int respuesta13;
  int respuesta14;
  int respuesta15;

  @override
  Widget build(BuildContext context) {
    consultar();
    print("activador hh ${pre.enc}");
    final sizes = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: sizes.width * 1,
        height: sizes.height * 1,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: sizes.width * 1,
              height: sizes.height * 0.01,
              color: Colors.white,
            ),
            Container(
              alignment: Alignment.center,
              width: sizes.width * 1,
              height: sizes.height * 0.05,
              color: Color.fromRGBO(40, 48, 79, 1),
              child: Text(
                pre.idioma ? "Encuesta de satisfaccion" : "Satisfaction survey",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: "evel"),
              ),
            ),
            Container(
              width: sizes.width * 1,
              height: sizes.height * 0.64,
              color: Colors.white,
              child: !pre.enc
                  ? Container(
                      width: sizes.width * 1,
                      height: sizes.height * 0.64,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: sizes.height * 0.25,
                          ),
                          pre.enc1
                              ? Text(
                                  pre.idioma
                                      ? "Usted ya realizo\ncheckout..."
                                      : "You already made\ncheckout...",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(40, 48, 79, 1),
                                    fontFamily: "evel",
                                  ),
                                )
                              : Text(
                                  pre.idioma
                                      ? "Este campo sera habilitado\nal momento del checkout..."
                                      : "This field will be\nenabled at checkout ...",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromRGBO(40, 48, 79, 1),
                                    fontFamily: "evel",
                                  ),
                                )
                        ],
                      ))
                  : ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma
                                    ? "¿Es su primera vez hospedándose en el Park Hotel?"
                                    : "Is this your first time staying at the Park Hotel?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  RadioListTile(
                                      activeColor:
                                          Color.fromRGBO(40, 48, 79, 1),
                                      title: Text(pre.idioma ? "Si" : "Yes"),
                                      value: 0,
                                      groupValue: respuesta1,
                                      onChanged: (val) {
                                        cambio1(val);
                                      }),
                                  RadioListTile(
                                      activeColor:
                                          Color.fromRGBO(40, 48, 79, 1),
                                      title: Text("No"),
                                      value: 1,
                                      groupValue: respuesta1,
                                      onChanged: (val) {
                                        cambio1(val);
                                      }),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: validator1
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma
                                    ? "¿Qué tuvo en cuenta a la hora de hospedarse en el Park Hotel?"
                                    : "What did you take into account when staying at the Park Hotel?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  RadioListTile(
                                      title: Text(pre.idioma
                                          ? "Ubicación"
                                          : "Ubication"),
                                      value: 0,
                                      groupValue: respuesta2,
                                      onChanged: (val) {
                                        cambio2(val);
                                      }),
                                  RadioListTile(
                                      activeColor:
                                          Color.fromRGBO(40, 48, 79, 1),
                                      title: Text(pre.idioma
                                          ? "Publicidad en redes sociales"
                                          : "Social media advertising"),
                                      value: 1,
                                      groupValue: respuesta2,
                                      onChanged: (val) {
                                        cambio2(val);
                                      }),
                                  RadioListTile(
                                      title: Text(pre.idioma
                                          ? "Recomendación"
                                          : "recommendation"),
                                      value: 2,
                                      groupValue: respuesta2,
                                      onChanged: (val) {
                                        cambio2(val);
                                      }),
                                  RadioListTile(
                                      activeColor:
                                          Color.fromRGBO(40, 48, 79, 1),
                                      title: Text(
                                          pre.idioma ? "Precios" : "Prices"),
                                      value: 3,
                                      groupValue: respuesta2,
                                      onChanged: (val) {
                                        cambio2(val);
                                      }),
                                  RadioListTile(
                                      activeColor:
                                          Color.fromRGBO(40, 48, 79, 1),
                                      title:
                                          Text(pre.idioma ? "Otros" : "others"),
                                      value: 4,
                                      groupValue: respuesta2,
                                      onChanged: (val) {
                                        cambio2(val);
                                      }),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: validator2
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma
                                    ? "En el Check-in y entrega de la habitación \n¿Le informaron nuestras campañas ambientales?"
                                    : "At Check-in and delivery of the room \n¿did our environmental campaigns inform you?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  RadioListTile(
                                      title: Text(pre.idioma ? "Si" : "Yes"),
                                      value: 0,
                                      groupValue: respuesta3,
                                      onChanged: (val) {
                                        cambio3(val);
                                      }),
                                  RadioListTile(
                                      activeColor:
                                          Color.fromRGBO(40, 48, 79, 1),
                                      title: Text("No"),
                                      value: 1,
                                      groupValue: respuesta3,
                                      onChanged: (val) {
                                        cambio3(val);
                                      }),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: (validator3)
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma
                                    ? "¿Cómo califica usted el compromiso del hotel en el cuidado y preservación del medio ambiente?"
                                    : "How do you rate the hotel's commitment to caring for and preserving the environment?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  RadioListTile(
                                      title: Text(pre.idioma
                                          ? "Excelente"
                                          : "Excelent"),
                                      value: 0,
                                      groupValue: respuesta4,
                                      onChanged: (val) {
                                        cambio4(val);
                                      }),
                                  RadioListTile(
                                      activeColor:
                                          Color.fromRGBO(40, 48, 79, 1),
                                      title:
                                          Text(pre.idioma ? "Bueno" : "Good"),
                                      value: 1,
                                      groupValue: respuesta4,
                                      onChanged: (val) {
                                        cambio4(val);
                                      }),
                                  RadioListTile(
                                      title: Text("Regular"),
                                      value: 2,
                                      groupValue: respuesta4,
                                      onChanged: (val) {
                                        cambio4(val);
                                      }),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: validator4
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: sizes.width * 1,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma
                                    ? "Para las siguientes preguntas, califique las diferentes áreas siendo 3 el más alto"
                                    : "For the following questions, rate the different areas with 3 being the highest",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma ? "Recepcion" : "reception",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: sizes.height * 0.04,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: sizes.width * 0.4),
                                      Text(
                                        "1",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.17),
                                      Text(
                                        "2",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "3",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Atencion y \n amabilidad"
                                                : "Attention and\nkindness",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta5,
                                          onChanged: (val) {
                                            cambio5(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta5,
                                          onChanged: (val) {
                                            cambio5(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta5,
                                          onChanged: (val) {
                                            cambio5(val);
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Rapidez y \n eficiencia en el check-in"
                                                : "Quick and efficient\n check-in",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta6,
                                          onChanged: (val) {
                                            cambio6(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta6,
                                          onChanged: (val) {
                                            cambio6(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta6,
                                          onChanged: (val) {
                                            cambio6(val);
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Rapidez y \n eficiencia en el check-out"
                                                : "Quick and efficient\ncheck-out",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta7,
                                          onChanged: (val) {
                                            cambio7(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta7,
                                          onChanged: (val) {
                                            cambio7(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta7,
                                          onChanged: (val) {
                                            cambio7(val);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: (validator5 || validator6 || validator7)
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma ? "Restaurante" : "Restaurant",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: sizes.height * 0.04,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: sizes.width * 0.41),
                                      Text(
                                        "1",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "2",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "3",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Atencion y \n amabilidad"
                                                : "Attention and\nkindness",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta8,
                                          onChanged: (val) {
                                            cambio8(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta8,
                                          onChanged: (val) {
                                            cambio8(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta8,
                                          onChanged: (val) {
                                            cambio8(val);
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Rapidez en \n el servicio"
                                                : "Quick service",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta9,
                                          onChanged: (val) {
                                            cambio9(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta9,
                                          onChanged: (val) {
                                            cambio9(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta9,
                                          onChanged: (val) {
                                            cambio9(val);
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "¿Cómo estuvo el desayuno?"
                                                : "How was\nbreakfast?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta10,
                                          onChanged: (val) {
                                            cambio10(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta10,
                                          onChanged: (val) {
                                            cambio10(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta10,
                                          onChanged: (val) {
                                            cambio10(val);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: (validator8 || validator9 || validator10)
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma ? "Habitaciones" : "Bedrooms",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: sizes.height * 0.04,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: sizes.width * 0.41),
                                      Text(
                                        "1",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "2",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "3",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Comodidad"
                                                : "Comfort",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta11,
                                          onChanged: (val) {
                                            cambio11(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta11,
                                          onChanged: (val) {
                                            cambio11(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta11,
                                          onChanged: (val) {
                                            cambio11(val);
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Limpieza"
                                                : "Cleaning",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta12,
                                          onChanged: (val) {
                                            cambio12(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta12,
                                          onChanged: (val) {
                                            cambio12(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta12,
                                          onChanged: (val) {
                                            cambio12(val);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: (validator11 || validator12)
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma ? "Botones" : "Bellhop",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: sizes.height * 0.04,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: sizes.width * 0.41),
                                      Text(
                                        "1",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "2",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "3",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Atencion y \n amabilidad"
                                                : "Attention and\nkindness",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta13,
                                          onChanged: (val) {
                                            cambio13(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta13,
                                          onChanged: (val) {
                                            cambio13(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta13,
                                          onChanged: (val) {
                                            cambio13(val);
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma ? "Servicio" : "Service",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta14,
                                          onChanged: (val) {
                                            cambio14(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta14,
                                          onChanged: (val) {
                                            cambio14(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta14,
                                          onChanged: (val) {
                                            cambio14(val);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: (validator13 || validator14)
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: sizes.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(40, 48, 79, 1),
                                blurRadius: 3.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pre.idioma ? "Camareras" : "Waitresses",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(40, 48, 79, 1),
                                  fontFamily: "evel",
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: sizes.height * 0.041,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: sizes.width * 0.4),
                                      Text(
                                        "1",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "2",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                      SizedBox(width: sizes.width * 0.16),
                                      Text(
                                        "3",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontFamily: "evel",
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: sizes.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: Text(
                                            pre.idioma
                                                ? "Atencion y \n amabilidad"
                                                : "Attention and\nkindness",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Color.fromRGBO(40, 48, 79, 1),
                                              fontFamily: "evel",
                                            ),
                                          ),
                                          width: sizes.width * 0.356),
                                      Radio(
                                          value: 1,
                                          groupValue: respuesta15,
                                          onChanged: (val) {
                                            cambio15(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 2,
                                          groupValue: respuesta15,
                                          onChanged: (val) {
                                            cambio15(val);
                                          }),
                                      SizedBox(width: sizes.width * 0.05),
                                      Radio(
                                          value: 3,
                                          groupValue: respuesta15,
                                          onChanged: (val) {
                                            cambio15(val);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                width: sizes.width * 1,
                                height: sizes.height * 0.01,
                                color: (validator15)
                                    ? Colors.red
                                    : Color.fromRGBO(40, 48, 79, 1),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(60, 1, 60, 1),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(40, 48, 79, 1),
                              ),
                            ),
                            child: Text(pre.idioma ? "Enviar" : "Send"),
                            onPressed: () {
                              if (respuesta1 != null) {
                                setState(() {
                                  validator1 = false;
                                });
                              } else {
                                setState(() {
                                  validator1 = true;
                                });
                              }
                              if (respuesta2 != null) {
                                setState(() {
                                  validator2 = false;
                                });
                              } else {
                                setState(() {
                                  validator2 = true;
                                });
                              }
                              if (respuesta3 != null) {
                                setState(() {
                                  validator3 = false;
                                });
                              } else {
                                setState(() {
                                  validator3 = true;
                                });
                              }
                              if (respuesta4 != null) {
                                setState(() {
                                  validator4 = false;
                                });
                              } else {
                                setState(() {
                                  validator4 = true;
                                });
                              }
                              if (respuesta5 != null) {
                                setState(() {
                                  validator5 = false;
                                });
                              } else {
                                setState(() {
                                  validator5 = true;
                                });
                              }
                              if (respuesta6 != null) {
                                setState(() {
                                  validator6 = false;
                                });
                              } else {
                                setState(() {
                                  validator6 = true;
                                });
                              }
                              if (respuesta7 != null) {
                                setState(() {
                                  validator7 = false;
                                });
                              } else {
                                setState(() {
                                  validator7 = true;
                                });
                              }
                              if (respuesta8 != null) {
                                setState(() {
                                  validator8 = false;
                                });
                              } else {
                                setState(() {
                                  validator8 = true;
                                });
                              }
                              if (respuesta9 != null) {
                                setState(() {
                                  validator9 = false;
                                });
                              } else {
                                setState(() {
                                  validator9 = true;
                                });
                              }
                              if (respuesta10 != null) {
                                setState(() {
                                  validator10 = false;
                                });
                              } else {
                                setState(() {
                                  validator10 = true;
                                });
                              }
                              if (respuesta11 != null) {
                                setState(() {
                                  validator11 = false;
                                });
                              } else {
                                setState(() {
                                  validator11 = true;
                                });
                              }
                              if (respuesta12 != null) {
                                setState(() {
                                  validator12 = false;
                                });
                              } else {
                                setState(() {
                                  validator12 = true;
                                });
                              }
                              if (respuesta13 != null) {
                                setState(() {
                                  validator13 = false;
                                });
                              } else {
                                setState(() {
                                  validator13 = true;
                                });
                              }
                              if (respuesta14 != null) {
                                setState(() {
                                  validator14 = false;
                                });
                              } else {
                                setState(() {
                                  validator14 = true;
                                });
                              }
                              if (respuesta15 != null) {
                                setState(() {
                                  validator15 = false;
                                });
                              } else {
                                setState(() {
                                  validator15 = true;
                                });
                              }
                              if (respuesta1 != null &&
                                  respuesta2 != null &&
                                  respuesta3 != null &&
                                  respuesta4 != null &&
                                  respuesta5 != null &&
                                  respuesta6 != null &&
                                  respuesta7 != null &&
                                  respuesta8 != null &&
                                  respuesta9 != null &&
                                  respuesta10 != null &&
                                  respuesta11 != null &&
                                  respuesta12 != null &&
                                  respuesta13 != null &&
                                  respuesta14 != null &&
                                  respuesta15 != null) {
                                checkout.nombre = nombre;
                                checkout.correo = correo;
                                checkout.cedula = cedula;
                                checkout.celular = celular;
                                checkout.fechaent = fechaent;
                                checkinprovider.crearcheckout(checkout);

                                encm.id = id;
                                encm.enc = false;
                                encm.estado = "Realizado";
                                checkinprovider.editarenc(encm);
                                pre.enc1 = true;

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      elevation: 20,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      title: Text(
                                        pre.idioma
                                            ? "Informacion"
                                            : "Information",
                                        style: TextStyle(
                                            fontFamily: "evel",
                                            color:
                                                Color.fromRGBO(40, 48, 79, 1),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      content: Text(
                                        pre.idioma
                                            ? "Su checkout ha sido exitoso"
                                            : "Your checkout has been successful",
                                        style: TextStyle(
                                            fontFamily: "evel",
                                            color:
                                                Color.fromRGBO(40, 48, 79, 1),
                                            fontSize: 15),
                                      ),
                                      actions: <Widget>[
                                        MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            color:
                                                Color.fromRGBO(40, 48, 79, 1),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, "homehuesped",
                                                  arguments: 1);
                                            },
                                            child: Text("Ok")),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      elevation: 20,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      title: Text(pre.idioma
                                          ? "Informacion"
                                          : "Information"),
                                      content: Text(pre.idioma
                                          ? "Faltan casillas por seleccionar \nrevise las areas marcadas en rojo"
                                          : "There are missing boxes to select\ncheck the areas marked in red"),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Ok")),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color.fromRGBO(40, 48, 79, 1),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              color: Color.fromRGBO(40, 48, 79, 1),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  cambio1(val) {
    setState(() {
      validator1 = false;
      respuesta1 = val;
      switch (val) {
        case 0:
          checkout.p1 = "si";
          break;
        case 1:
          checkout.p1 = "no";
          break;
      }
    });
  }

  cambio2(val) {
    setState(() {
      validator2 = false;
      respuesta2 = val;
      switch (val) {
        case 0:
          checkout.p2 = "ubicacion";
          break;
        case 1:
          checkout.p2 = "publicidad";
          break;
        case 2:
          checkout.p2 = "recomendacion";
          break;
        case 3:
          checkout.p2 = "precios";
          break;
        case 4:
          checkout.p2 = "otros";

          break;
      }
    });
  }

  cambio3(val) {
    setState(() {
      validator3 = false;
      respuesta3 = val;
      switch (val) {
        case 0:
          checkout.p3 = "si";
          break;
        case 1:
          checkout.p3 = "no";
          break;
      }
    });
  }

  cambio4(val) {
    setState(() {
      validator4 = false;
      respuesta4 = val;
      switch (val) {
        case 0:
          checkout.p4 = "Excelente";
          break;
        case 1:
          checkout.p4 = "Bueno";
          break;
        case 2:
          checkout.p4 = "Regular";
          break;
      }
    });
  }

  cambio5(val) {
    setState(() {
      validator5 = false;
      respuesta5 = val;
      switch (val) {
        case 1:
          checkout.p5 = "Regular";
          break;
        case 2:
          checkout.p5 = "Bueno";
          break;
        case 3:
          checkout.p5 = "Excelente";
          break;
      }
    });
  }

  cambio6(val) {
    setState(() {
      validator6 = false;
      respuesta6 = val;
      switch (val) {
        case 1:
          checkout.p6 = "Regular";
          break;
        case 2:
          checkout.p6 = "Bueno";
          break;
        case 3:
          checkout.p6 = "Excelente";
          break;
      }
    });
  }

  cambio7(val) {
    setState(() {
      validator7 = false;
      respuesta7 = val;
      switch (val) {
        case 1:
          checkout.p7 = "Regular";
          break;
        case 2:
          checkout.p7 = "Bueno";
          break;
        case 3:
          checkout.p7 = "Excelente";
          break;
      }
    });
  }

  cambio8(val) {
    setState(() {
      validator8 = false;
      respuesta8 = val;
      switch (val) {
        case 1:
          checkout.p8 = "Regular";
          break;
        case 2:
          checkout.p8 = "Bueno";
          break;
        case 3:
          checkout.p8 = "Excelente";
          break;
      }
    });
  }

  cambio9(val) {
    setState(() {
      validator9 = false;
      respuesta9 = val;
      switch (val) {
        case 1:
          checkout.p9 = "Regular";
          break;
        case 2:
          checkout.p9 = "Bueno";
          break;
        case 3:
          checkout.p9 = "Excelente";
          break;
      }
    });
  }

  cambio10(val) {
    setState(() {
      validator10 = false;
      respuesta10 = val;
      switch (val) {
        case 1:
          checkout.p10 = "Regular";
          break;
        case 2:
          checkout.p10 = "Bueno";
          break;
        case 3:
          checkout.p10 = "Excelente";
          break;
      }
    });
  }

  cambio11(val) {
    setState(() {
      validator11 = false;
      respuesta11 = val;
      switch (val) {
        case 1:
          checkout.p11 = "Regular";
          break;
        case 2:
          checkout.p11 = "Bueno";
          break;
        case 3:
          checkout.p11 = "Excelente";
          break;
      }
    });
  }

  cambio12(val) {
    setState(() {
      validator12 = false;
      respuesta12 = val;
      switch (val) {
        case 1:
          checkout.p12 = "Regular";
          break;
        case 2:
          checkout.p12 = "Bueno";
          break;
        case 3:
          checkout.p12 = "Excelente";
          break;
      }
    });
  }

  cambio13(val) {
    setState(() {
      validator13 = false;
      respuesta13 = val;
      switch (val) {
        case 1:
          checkout.p13 = "Regular";
          break;
        case 2:
          checkout.p13 = "Bueno";
          break;
        case 3:
          checkout.p13 = "Excelente";
          break;
      }
    });
  }

  cambio14(val) {
    setState(() {
      validator14 = false;
      respuesta14 = val;
      switch (val) {
        case 1:
          checkout.p14 = "Regular";
          break;
        case 2:
          checkout.p14 = "Bueno";
          break;
        case 3:
          checkout.p14 = "Excelente";
          break;
      }
    });
  }

  cambio15(val) {
    setState(() {
      validator15 = false;
      respuesta15 = val;
      switch (val) {
        case 1:
          checkout.p15 = "Regular";
          break;
        case 2:
          checkout.p15 = "Bueno";
          break;
        case 3:
          checkout.p15 = "Excelente";
          break;
      }
    });
  }

  consultar() async {
    final eh = await checkinprovider.cargarenc();
    final datos = await checkinprovider.cargarsolicitudtitular();

    if (this.mounted) {
      if (eh != null) {
        setState(() {
          nombre = datos[0].nombre;
          fechaent = datos[0].fechae;
          correo = datos[0].correo;
          celular = datos[0].celular;
          cedula = datos[0].ident;
          pre.enc = eh[0].enc;
          id = eh[0].id;
        });
      } else {
        pre.enc = false;
      }
    }
    return;
  }
}
