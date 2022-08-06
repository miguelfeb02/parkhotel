import 'package:flutter/material.dart';

import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final llave = GlobalKey<FormState>();
  final auth = new Auth();
  final PreferenciasUsuario pre = new PreferenciasUsuario();

  String email = "correo";
  String contrasena = "contrasena";

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "inicio");
        return false;
      },
      child: Scaffold(
          body: Stack(children: <Widget>[
        Container(
          height: sizes.height * 0.5,
          width: sizes.width * 1,
          color: Color.fromRGBO(40, 48, 79, 1),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Icon(
                Icons.email,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(
                height: 15,
              ),
              // Text(
              //   "PARK HOTEL APP",
              //   style: TextStyle(fontSize: 30, color: Colors.white),
              // )
            ],
          ),
        ),
        SingleChildScrollView(
          controller: ScrollController(),
          padding: EdgeInsets.fromLTRB(40, 160, 40, 40),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                          offset: Offset(0, 5),
                          spreadRadius: 3)
                    ]),
                padding: EdgeInsets.all(15),
                width: sizes.width * 0.80,
                child: Form(
                  key: llave,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Text(pre.idioma?"Ingreso con Email":"Login with Email", style: TextStyle(
                        fontFamily: "evel",
                        color: Color.fromRGBO(40, 48, 79, 1),
                        fontSize: 20)),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            // icon: Icon(Icons.alternate_email),
                            labelText: pre.idioma?"correo":"Mail",
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ?"Texto vacio":"Empty Text";
                          } else {
                            if (value.contains(" ")) {
                              return pre.idioma?"No se permiten espacios":"No spaces allowed";
                            } else {
                              if (!value.contains("@")) {
                                return pre.idioma?'Formato invalido de correo':"Invalid mail format";
                              } else {
                                if (!value.contains(".")) {
                                  return pre.idioma?'Formato invalido de correo':"Invalid mail format";
                                } else {
                                  return null;
                                }
                              }
                            }
                          }
                        },
                        onSaved: (value) => email = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        obscureText: true,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            // icon: Icon(Icons.lock_outline),
                            labelText:pre.idioma?"Contraseña":"Password",
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma? "Texto vacio":"Empty Text";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => contrasena = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                            child: Text(pre.idioma?"Enviar":"Send",style: TextStyle(
                              fontFamily: "evel"
                            ),),
                          ),
                          color: Color.fromRGBO(40, 48, 79, 1),
                          textColor: Colors.white,
                          onPressed: () async {
                            if (!llave.currentState.validate()) return;
                            llave.currentState.save();
                            final log = await auth.login(email, contrasena);
                            print(pre.nombre);
                            if (log == "si") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    title: Text(pre.idioma?"Informacion":"Information"),
                                    content: Text(pre.idioma?"Inicio de sesion exitoso":"Login Successful"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            pre.token = "homehuesped";
                                            Navigator.pushNamed(
                                                context, "pagina");
                                          },
                                          child: Text("OK"))
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
                                        borderRadius: BorderRadius.circular(6)),
                                    title: Text(pre.idioma?"Informacion":"Information"),
                                    content: Text("$log"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"))
                                    ],
                                  );
                                },
                              );
                            }
                          }),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(pre.idioma?
                      "¿Aun no esta registrado?":"Not registered yet?",style: TextStyle(
                          color: Color.fromRGBO(40, 48, 79, 1),
                          fontFamily: "evel"
                        ),
                    ),
                    RawMaterialButton(
                        child: Text(pre.idioma?"Registrar":"Register",style: TextStyle(
                          color: Color.fromRGBO(40, 48, 79, 1),
                          fontFamily: "evel",
                          fontWeight: FontWeight.w900
                        ),),
                        onPressed: () {
                          Navigator.pushNamed(context, "registro");
                        })
                  ],
                ),
              )
            ],
          ),
        )
      ])),
    );
  }
}
