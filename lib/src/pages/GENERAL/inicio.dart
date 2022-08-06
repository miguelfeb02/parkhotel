import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parkhotel/src/providers/checkin_provider.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final auth = new Auth();

  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final checkinprovider = CheckinProvider();

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              title: Text(
                "Informacion",
                style: TextStyle(
                  fontFamily: "evel",
                  color: Color.fromRGBO(40, 48, 79, 1),
                ),
              ),
              content: Text(
                "¿Esta seguro que desea salir?",
                style: TextStyle(
                  fontFamily: "evel",
                  color: Color.fromRGBO(40, 48, 79, 1),
                ),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text("Si")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No")),
              ],
            );
          },
        );

        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: sizes.height * 1,
              width: sizes.width * 1,
              color: Color.fromRGBO(40, 48, 79, 1),
              child: Column(
                children: [
                  SizedBox(
                    height: sizes.height * 0.57,
                  ),
                  Container(
                    height: sizes.height * 0.40,
                    width: sizes.width * 1,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "English",
                              style: TextStyle(
                                fontFamily: "evel",
                                color: Colors.white,
                              ),
                            ),
                            Switch(
                                activeColor: Colors.orange,
                                hoverColor: Colors.white,
                                activeTrackColor: Colors.white,
                                value: pre.idioma,
                                onChanged: (value) {
                                  setState(() {
                                    pre.idioma = value;
                                  });
                                }),
                            Text(
                              "Español",
                              style: TextStyle(
                                fontFamily: "evel",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: sizes.height * 0.02,
                        ),
                        SignInButtonBuilder(
                          backgroundColor: Colors.white,
                          height: 40,
                          width: 232,
                          text: pre.idioma
                              ? 'Continua con Google'
                              : "Continue with Google",
                          textColor: Colors.black,
                          icon: IconMoon.icon_google,
                          iconColor: Color.fromRGBO(40, 48, 79, 1),
                          onPressed: () async {
                            final logg = await auth.signInWithGoogle();
                           

                            if (logg!="network_error") {
                               print(logg);
                               String x = logg.email;
                               String y = x.replaceAll("@", "_");
                                  String z = y.replaceAll(".", "_");
                               pre.correoreal = x;
                               pre.nombre = logg.displayName;
                               pre.correo = z;
                               pre.foto = logg.photoUrl;
                                 pre.token = "homehuesped";
                                Navigator.pushNamed(context, "pagina1");
                            }
                            else {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    title: Text("Informacion"),
                                    content: Text(
                                        "Por favor revise su conexion a internet"),
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
                        SizedBox(
                          height: 16,
                        ),
                        SignInButtonBuilder(
                          backgroundColor: Colors.white,
                          height: 40,
                          width: 232,
                          text: pre.idioma
                              ? 'Continua con Email'
                              : 'Continue with Email',
                          textColor: Colors.black,
                          icon: Icons.email,
                          iconColor: Color.fromRGBO(40, 48, 79, 1),
                          onPressed: () {
                            Navigator.pushNamed(context, "login");
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),

                        // SignInButtonBuilder(
                        //   backgroundColor: Colors.white,
                        //   height: 40,
                        //   width: 232,
                        //   text: 'Continua con Facebook',
                        //   textColor: Colors.black,
                        //   icon: IconMoon.icon_facebook,
                        //   iconColor: Color.fromRGBO(40, 48, 79, 1),
                        //   onPressed: () async {
                        //     // ignore: unused_local_variable
                        //     final log = await auth.loginfb2();
                        //     pre.token = "homehuesped";

                        //     if (pre.fb == true) {
                        //       pre.token = "homehuesped";
                        //       Navigator.pushNamed(context, "pagina1");
                        //     }

                        //     if (pre.fb == false) {
                        //       showDialog(
                        //         context: context,
                        //         builder: (context) {
                        //           return AlertDialog(
                        //             elevation: 20,
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(6)),
                        //             title: Text("Informacion"),
                        //             content: Text(
                        //                 "Ya te encuentras registrado con este correo."),
                        //             actions: <Widget>[
                        //               TextButton(
                        //                   onPressed: () {
                        //                     print(pre.nombre);
                        //                     if (pre.nombre != "null") {
                        //                       Navigator.pushNamed(
                        //                           context, "pagina1");
                        //                     } else {
                        //                       Navigator.pop(context);
                        //                     }
                        //                   },
                        //                   child: Text("OK"))
                        //             ],
                        //           );
                        //         },
                        //       );
                        //     }
                        //   },
                        // ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(height: 10),
                        Container(
                            child: Column(
                          children: [
                            Text(
                              pre.idioma
                                  ? "Si continuas, estas aceptando"
                                  : "If you continue, you are accepting",
                              style: TextStyle(color: Colors.white),
                            ),
                            RawMaterialButton(
                                child: Text(
                                  pre.idioma
                                      ? "Terminos y condiciones, y politicas de\n privacidad de PARK HOTEL"
                                      : "Terms and conditions, and privacy\n policies of PARK HOTEL",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, "contrato");
                                })
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: sizes.height * 0.55,
              width: sizes.width * 1,
              //child: Image(image: AssetImage('recursos/front.jpg'),fit: BoxFit.fill,),
            ),
            Container(
              height: sizes.height * 0.55,
              width: sizes.width * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(50, 30),
                      bottomRight: Radius.elliptical(50, 30))),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                      height: sizes.height * 0.5,
                      width: sizes.width * 0.8,
                      child: Image(
                        image: AssetImage('recursos/logo2.png'),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
