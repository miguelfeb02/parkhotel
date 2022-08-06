import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkhotel/src/models/cmodel.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/checkin_provider.dart';
import 'package:intl/intl.dart';

class Checkina extends StatefulWidget {
  @override
  _CheckinaState createState() => _CheckinaState();
}

class _CheckinaState extends State<Checkina> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();

  String ruta;
  final llave = GlobalKey<FormState>();

  final checkinprovider = CheckinProvider();
  final f = new DateFormat('yyyy-MM-dd hh:mm');
  Checkinmodel checkin = new Checkinmodel();
  TextEditingController fotocontrol = TextEditingController();
  TextEditingController controlcc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(" active fotos ${pre.activefotos}");
    
    final Checkinmodel checkindata = ModalRoute.of(context).settings.arguments;

    // print("url1 ${checkindata.fotourl1}");

    if (checkindata != null) {
      checkin = checkindata;
    }

    if (pre.active == true) {
      fotocontrol.text = pre.idioma?"-Foto cargada-":"-photo uploaded-";
      controlcc.text = checkin.nident;
    }

    if (pre.validar == true) {
      fotocontrol.text = pre.idioma?"Foto cargada":"photo uploaded";
    }
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              title: Text(pre.idioma ?"Informacion":"Information",
              style: TextStyle(
                fontFamily: "evel",
                color: Color.fromRGBO(40, 48, 79, 1),
                fontSize: 18
              ),),
              content: pre.bck==true 
              ? Text(pre.idioma? " ¿ Desea cancelar la edicion del checkin ? \n\n Se perderan los datos diligenciados"
                  :"Do you want to cancel the checkin edition? \n\n The data filled in will be lost",
              style: TextStyle(
                fontFamily: "evel",
                color: Color.fromRGBO(40, 48, 79, 1),
                fontSize: 15
              ),)
              : Text(pre.idioma?"¿ Desea cancelar el checkin ? \n\n Se perderan los datos diligenciados"
                  :"Do you want to cancel the check-in? \n \n The data filled in will be lost",
              style: TextStyle(
                fontFamily: "evel",
                color: Color.fromRGBO(40, 48, 79, 1),
                fontSize: 15
              ),),
              actions: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                    color: Color.fromRGBO(40, 48, 79, 1),
                    onPressed: () {
                      Navigator.pushNamed(context, "homehuesped");
                    },
                    child: Text(pre.idioma?"Si":"Yes")),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                      color: Color.fromRGBO(40, 48, 79, 1),
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
          appBar: AppBar(
            elevation: 30,
            title: pre.bck==true
            ? Text(pre.idioma?'Editor Check-In Acompañantes':"Editor Check-In companions",)
            :Text(pre.idioma?'Check-In Acompañantes':"Check-In companions",style: TextStyle(
              fontFamily: "evel"
            ),)
          ),
          body: Container(
              padding: EdgeInsets.all(25),
              child: Form(
                  key: llave,
                  child: SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      TextFormField(
                        enabled: true,
                        initialValue: checkin.nombre,
                        maxLines: 1,
                        // maxLength: 40,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                         labelText: pre.idioma?"Nombre y Apellido":"Name and last name",
                          icon: Icon(
                            Icons.person,
                            color: Color.fromRGBO(40, 48, 79, 1),
                            size: 30,
                          ),
                          // border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => checkin.nombre = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      
                      TextFormField(
                        controller: controlcc,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText:pre.idioma? "Tipo de documento":"document type",
                            icon: Icon(
                              Icons.chrome_reader_mode,
                              color: Color.fromRGBO(40, 48, 79, 1),
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            return null;
                          }
                        },
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          pre.active = false;
                          documento();
                        },
                      ),
                       SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        initialValue: checkin.ident,
                        maxLines: 1,
                        // maxLength: 150,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelText:pre.idioma? "Numero de documento":"document number",
                          icon: Icon(
                            Icons.chrome_reader_mode,
                            color: Color.fromRGBO(40, 48, 79, 1),
                            size: 30,
                          ),
                          // border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => checkin.ident = value,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: fotocontrol,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.camera_alt,
                            color: Color.fromRGBO(40, 48, 79, 1),
                            size: 30,
                          ),
                          labelText:pre.idioma? "Fotos del documento":"photos of the document",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma?"Por favor cargue una foto":"Please upload a photo";
                          } else {
                            return null;
                          }
                        },
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          pre.active = false;

                          pre.cargandofoto = true;
                          Navigator.pushNamed(context, "foto2",arguments: checkin);
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
                            child:pre.bck==true
                           ? Text(pre.idioma?"Enviar Check-In":"Send Check-In")
                                  : Text(pre.idioma?"Guardar Check-In":"Save Check-In")),
                          
                          color: Color.fromRGBO(40, 48, 79, 1),
                          textColor: Colors.white,
                          onPressed: () async {
                            print("ruta es ${pre.ruta}");
                            print(pre.validar);
                            checkin.fotourl1 = pre.rutanet;
                            checkin.fotourl2 = pre.rutanet2;
                            checkin.nident = controlcc.text;
                            if (!llave.currentState.validate()) return;

                            llave.currentState.save();
                            if (checkin.id!=null){
                              checkinprovider.editaracom(checkin);

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  title: Text(pre.idioma?"Informacion":"Information",style: TextStyle(
                                    fontFamily: "evel",
                                    fontSize: 18,
                                    color: Color.fromRGBO(40, 48, 79, 1),
                                  ),),
                                  content: Text(pre.idioma?"Su checkin ha sido editado":"Your checkin has been edited",style: TextStyle(
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
                                              context, "homehuesped");
                                        },
                                        child: Text("Ok")),
                                  ],
                                );
                              },
                            );
                            }else{
                              checkinprovider.crearsolicitudacompanantes(checkin);

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  title: Text(pre.idioma?
                                      "Informacion":"Information",style: TextStyle(
                                    fontFamily: "evel",
                                    fontSize: 18,
                                    color: Color.fromRGBO(40, 48, 79, 1),
                                  ),),
                                  content: Text(pre.idioma?
                                      "Su checkin ha sido exitoso":"Your checkin has been successful",style: TextStyle(
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
                                              context, "homehuesped");
                                        },
                                        child: Text("Ok")),
                                  ],
                                );
                              },
                            );
                            }
                            
                          }),
                    ],
                  ))))),
    );
  }
  documento() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: Container(
            height: 170,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  child: Row(
                    children: [
                      SizedBox(
                        child: Icon(Icons.arrow_right),
                        width: 30,
                      ),
                      Text(pre.idioma?
                        "Cedula de ciudadania":"citizenship card",
                        style: TextStyle(
                          fontFamily: "evel",
                          color: Color.fromRGBO(40, 48, 79, 1),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  onPressed: () {
                    controlcc.text = pre.idioma? "Cedula de ciudadania":"citizenship card";
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  child: Row(
                    children: [
                      SizedBox(
                        child: Icon(Icons.arrow_right),
                        width: 30,
                      ),
                      Text(pre.idioma?
                        "Cedula de Extranjeria":"Foreigner ID",
                        style: TextStyle(
                          fontFamily: "evel",
                          color: Color.fromRGBO(40, 48, 79, 1),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  onPressed: () {
                    controlcc.text =pre.idioma? "Cedula de Extranjeria":"Foreigner ID";
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  child: Row(
                    children: [
                      SizedBox(
                        child: Icon(Icons.arrow_right),
                        width: 30,
                      ),
                      Text(pre.idioma?
                        "Pasaporte":"passport",
                        style: TextStyle(
                          fontFamily: "evel",
                          color: Color.fromRGBO(40, 48, 79, 1),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  onPressed: () {
                    controlcc.text = pre.idioma?
                        "Pasaporte":"passport";
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
