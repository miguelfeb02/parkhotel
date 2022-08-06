import 'package:flutter/material.dart';
import 'package:parkhotel/src/models/pmodel.dart';

import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/pqr_provider.dart';

class Addpqr extends StatefulWidget {
  @override
  AddpqrState createState() => AddpqrState();
}

class AddpqrState extends State<Addpqr> {
  final llave = GlobalKey<FormState>();
  final pqrprovider = PqrProvider();
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  TextEditingController fotocontrol = TextEditingController();
  Pqrmodel pqr = new Pqrmodel();

  @override
  Widget build(BuildContext context) {
    print(pre.validar);
    if (pre.validar == true) {
      fotocontrol.text = "Foto cargada";
    }
    pqr.usuario = pre.nombre;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 30,
            title: Text(
              'Agregar PQR',
            ),
          ),
          body: Container(
              padding: EdgeInsets.all(25),
              child: Form(
                  key: llave,
                  child: SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        initialValue: pqr.asunto,
                        maxLines: 1,
                        maxLength: 25,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelText: "Asunto",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => pqr.asunto = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        initialValue: pqr.descripcion,
                        maxLength: 150,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelText: "Descripcion",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => pqr.descripcion = value,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: fotocontrol,
                        
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration:
                            InputDecoration(labelText: "Foto evidencia"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            return null;
                          }
                        },
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          // pre.active = false;
                          pre.validar = false;
                          pre.cargandofoto = true;
                          Navigator.pushNamed(context, "fotopqr");
                        },
                        
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                            child: Text("Enviar"),
                          ),
                          color: Color.fromRGBO(40, 48, 79, 1),
                          textColor: Colors.white,
                          onPressed: () {
                            if (!llave.currentState.validate()) return;
                            pqr.urlfoto = pre.rutanet;
                            llave.currentState.save();

                            pqrprovider.crearpqr(pqr);

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  title: Text("Informacion"),
                                  content: Text("Su PQR ha sido creadO"),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "homehuesped",
                                              arguments: 2);
                                        },
                                        child: Text("Ok")),
                                  ],
                                );
                              },
                            );
                          }),
                    ],
                  ))))),
    );
  }
}
