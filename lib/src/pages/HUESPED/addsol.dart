import 'package:flutter/material.dart';
import 'package:parkhotel/src/models/smodel.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/solicitudes_provider.dart';

class ListaSolicitudes extends StatefulWidget {
  @override
  _ListaSolicitudesState createState() => _ListaSolicitudesState();
}

class _ListaSolicitudesState extends State<ListaSolicitudes> {
  final llave = GlobalKey<FormState>();
  final solicitudesprovider = SolicitudesProvider();
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  Solicitudesmodel solicitudes = new Solicitudesmodel();
  TextEditingController fotocevi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(" cargando foto es ${pre.cargandofoto}");
    if (pre.validar == true) {
      fotocevi.text = "Fotos cargada";
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 30,
            title: Text(
              'Agregar solicitud',
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
                        height: 25,
                      ),
                      TextFormField(
                        initialValue: solicitudes.asunto,
                        maxLines: 1,
                        maxLength: 25,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText: "Asunto", border: OutlineInputBorder()),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => solicitudes.asunto = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        initialValue: solicitudes.descripcion,
                        maxLines: 8,
                        maxLength: 150,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelText: "Descripcion",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => solicitudes.descripcion = value,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: fotocevi,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.camera_alt,
                            color: Color.fromRGBO(40, 48, 79, 1),
                            size: 30,
                          ),
                          labelText: "Foto evidencia",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Por favor cargue una foto";
                          } else {
                            return null;
                          }
                        },
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          pre.active = false;

                          pre.cargandofoto = true;
                          Navigator.pushNamed(context, "fotosol");
                        },
                        //onSaved: (value) => checkin.fotourl = value,
                      ),
                      SizedBox(
                        height: 50,
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
                            solicitudes.url = pre.rutanetsol;
                            if (!llave.currentState.validate()) return;

                            llave.currentState.save();

                            solicitudesprovider.crearsolicitud(solicitudes);

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  title: Text("Informacion",style: TextStyle(
                                    fontFamily: "evel",
                                    fontSize: 18,
                                    color: Color.fromRGBO(40, 48, 79, 1),
                                  ),),
                                  content: Text("Su Solicitud ha sido creada",style: TextStyle(
                                    fontFamily: "evel",
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 48, 79, 1),
                                  ),),
                                  actions: <Widget>[
                                    MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                        color: Color.fromRGBO(40, 48, 79, 1),
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
                          }),
                    ],
                  ))))),
    );
  }
}
