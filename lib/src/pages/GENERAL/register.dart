import 'package:flutter/material.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/auth.dart';

class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final llave = GlobalKey<FormState>();
  final auth = new Auth();

  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  String usuario = "usuario";
  String email = "correo";
  String contrasena = "contrasena";
  // Loginmodel login = new Loginmodel();
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: sizes.height * 0.4,
        width: sizes.width * 1,
        color: Color.fromRGBO(40, 48, 79, 1),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            // Icon(
            //   Icons.person_pin_circle,
            //   color: Colors.white,
            //   size: 100,
            // ),
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
        padding: EdgeInsets.fromLTRB(40, 70, 40, 40),
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
                    Text(pre.idioma?"Registro con Email":"Register with Email", style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(40, 48, 79, 1),
                      fontFamily: "evel",)),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.alternate_email),
                          labelText: pre.idioma?"Nombre y Apellido":"Name and Lastname",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return pre.idioma ?"Texto vacio":"Empty Text";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) => pre.nombre = value,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          // icon: Icon(Icons.alternate_email),
                          labelText:pre.idioma? "Correo":"Mail",
                          border: OutlineInputBorder()),
                      // ignore: missing_return
                      validator: (value) {
                        if (value.contains(" ")) {
                          return pre.idioma?"No se permiten espacios":"No spaces allowed";
                        } else {
                          if (value.isEmpty) {
                            return pre.idioma ?"Texto vacio":"Empty Text";
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
                          labelText:pre.idioma? "Contraseña":"Password",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return pre.idioma ?"Texto vacio":"Empty Text";
                        } else {
                          if (value.contains(" ")) {
                            return pre.idioma?'la contraseña no puede contener espacios':"password cannot contain spaces";
                          } else {
                            return null;
                          }
                        }
                      },
                      onSaved: (value) => contrasena = value,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // TextFormField(
                    //   obscureText: true,
                    //   maxLines: 1,
                    //   keyboardType: TextInputType.emailAddress,
                    //   textCapitalization: TextCapitalization.sentences,
                    //   decoration: InputDecoration(
                    //       // icon: Icon(Icons.alternate_email),
                    //       labelText:pre.idioma? "Repita la Contraseña":"Repeat password",
                    //       border: OutlineInputBorder()),
                    //   // validator: (value) {
                    //   //   if (value.isEmpty) {
                    //   //     return "Texto vacio";
                    //   //   } else {
                    //   //     return null;
                    //   //   }
                    //   // },
                    //   // onSaved: (value) => email = value,
                    // ),
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
                            fontFamily: "evel",
                            
                          ),),
                        ),
                        color: Color.fromRGBO(40, 48, 79, 1),
                        textColor: Colors.white,
                        onPressed: () async {
                          if (!llave.currentState.validate()) return;
                          llave.currentState.save();

                          final reg = await auth.registro(email, contrasena);

                          if (reg == "si") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  title: Text(pre.idioma?"Informacion":"Information"),
                                  content: Text(pre.idioma?
                                      "Se ha enviado un correo para validar su cuenta":"An email has been sent to validate your account"),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, "login");
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
                                  content: Text("$reg"),
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
                  Text(pre.idioma?"¿ ya estas registrado ?":"you are already registered?",style: TextStyle(
                          color: Color.fromRGBO(40, 48, 79, 1),
                          fontFamily: "evel",
                          
                        ),),
                  RawMaterialButton(
                      child: Text(pre.idioma?"Ingresar":"Sign in",style: TextStyle(
                          color: Color.fromRGBO(40, 48, 79, 1),
                          fontFamily: "evel",
                          fontWeight: FontWeight.w900
                        ),),
                      onPressed: () {
                        Navigator.pushNamed(context, "login");
                      })
                ],
              ),
            )
          ],
        ),
      )
    ]));
  }
}
