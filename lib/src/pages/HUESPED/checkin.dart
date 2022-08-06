import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkhotel/src/models/cmodel.dart';
import 'package:parkhotel/src/models/encmodel.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/checkin_provider.dart';
import 'package:intl/intl.dart';

class Checkin extends StatefulWidget {
  @override
  _CheckinState createState() => _CheckinState();
}

class _CheckinState extends State<Checkin> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();

  DateTime fecha1;
  DateTime fecha2;
  String ruta;

  final llave = GlobalKey<FormState>();

  final checkinprovider = CheckinProvider();
  final f = new DateFormat('yyyy-MM-dd hh:mm');
  Checkinmodel checkin = new Checkinmodel();
  Encmodel encm = new Encmodel();
  TextEditingController fotocontrol = TextEditingController();
  TextEditingController control = TextEditingController();
  TextEditingController control2 = TextEditingController();
  TextEditingController controlcc = TextEditingController();
  DateTime date;
  DateTime selectedDate = DateTime.now();
  bool bfecha;
  bool active;
  String values = "C.C.";

  @override
  Widget build(BuildContext context) {
    print("activefotos esta ${pre.activefotos}");
    print("active ${pre.active}");
    final Checkinmodel checkindata = ModalRoute.of(context).settings.arguments;
    if (checkindata != null) {
      checkin = checkindata;
    }
    if (pre.active == true) {
      control.text = checkin.fechae;
      control2.text = checkin.fechas;
      final value1 = checkin.fechae.replaceAll("/", "-");
      final value2 = checkin.fechas.replaceAll("/", "-");
      fecha1 = DateTime.parse(value1);
      fecha2 = DateTime.parse(value2);

      fotocontrol.text = pre.idioma ? "-Fotos cargadas-" : "-photos uploaded-";
      controlcc.text = checkin.nident;
    }

    if (pre.validar == true) {
      fotocontrol.text = pre.idioma ? "Fotos cargadas" : "photos uploaded";
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
              title: Text(
                pre.idioma ? "Informacion" : "Information",
                style: TextStyle(
                  fontFamily: "evel",
                  color: Color.fromRGBO(40, 48, 79, 1),
                ),
              ),
              content: pre.bck == true
                  ? Text(
                      pre.idioma
                          ? " ¿ Desea cancelar la edicion del checkin ? \n\n Se perderan los datos diligenciados"
                          : "Do you want to cancel the checkin edition? \n\n The data filled in will be lost",
                      style: TextStyle(
                        fontFamily: "evel",
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),
                    )
                  : Text(
                      pre.idioma
                          ? "¿ Desea cancelar el checkin ? \n\n Se perderan los datos diligenciados"
                          : "Do you want to cancel the check-in? \n \n The data filled in will be lost",
                      style: TextStyle(
                        fontFamily: "evel",
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),
                    ),
              actions: <Widget>[
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color.fromRGBO(40, 48, 79, 1),
                    onPressed: () {
                      Navigator.pushNamed(context, "homehuesped");
                    },
                    child: Text(pre.idioma ? "Si" : "Yes")),
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
              title: pre.bck == false
                  ? Text('Check-In titular')
                  : Text(
                      ' Editor Check-In titular',
                    )),
          body: Container(
              padding: EdgeInsets.all(25),
              child: Form(
                  key: llave,
                  child: SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      TextFormField(
                        initialValue: checkin.nombre,
                        enabled: true,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText: pre.idioma
                                ? "Nombre y Apellido"
                                : "Name and last name",
                            icon: Icon(
                              Icons.person,
                              color: Color.fromRGBO(40, 48, 79, 1),
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
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
                            labelText: pre.idioma
                                ? "Tipo de documento"
                                : "document type",
                            icon: Icon(
                              Icons.chrome_reader_mode,
                              color: Color.fromRGBO(40, 48, 79, 1),
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        maxLines: 1,
                        initialValue: checkin.ident,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText: pre.idioma
                                ? "Numero de documento"
                                : "document number",
                            icon: Icon(
                              Icons.chrome_reader_mode,
                              color: Color.fromRGBO(40, 48, 79, 1),
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => checkin.ident = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        initialValue: pre.correoreal,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            icon: Icon(
                              Icons.email,
                              color: Color.fromRGBO(40, 48, 79, 1),
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
                          } else {
                            if (!value.contains("@") || !value.contains(".")) {
                              return pre.idioma
                                  ? "Formato de correo invalido"
                                  : "Invalid email format";
                            } else {
                              return null;
                            }
                          }
                        },
                        onSaved: (value) => checkin.correo = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        initialValue: checkin.direc,
                        //initialValue: checkin.asunto,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText: pre.idioma
                                ? "Direccion de residencia"
                                : " Address",
                            icon: Icon(
                              Icons.markunread_mailbox,
                              color: Color.fromRGBO(40, 48, 79, 1),
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => checkin.direc = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        initialValue: checkin.nacio,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText:
                                pre.idioma ? "Nacionalidad" : "Nationality",
                            icon: Icon(
                              Icons.flag,
                              color: Color.fromRGBO(40, 48, 79, 1),
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => checkin.nacio = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        initialValue: checkin.ciudad,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                            labelText: pre.idioma ? "Ciudad " : " City",
                            icon: Icon(
                              Icons.location_city,
                              color: Color.fromRGBO(40, 48, 79, 1),
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => checkin.ciudad = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        initialValue: checkin.celular,
                        maxLines: 1,
                        maxLength: 40,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelText: pre.idioma ? "Celular " : " Mobile",
                          icon: Icon(
                            Icons.phone_android,
                            color: Color.fromRGBO(40, 48, 79, 1),
                            size: 30,
                          ),
                          // border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) => checkin.celular = value,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: control,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.date_range,
                            color: Color.fromRGBO(40, 48, 79, 1),
                            size: 30,
                          ),
                          labelText:
                              pre.idioma ? "Fecha de entrada" : "Check in date",
                          // border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma ? "Texto vacio" : "empty text";
                          } else {
                            return null;
                          }
                        },
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          final dato = await selectDate(context);
                          pre.active = false;

                          fecha1 = dato;
                          print("este es el dato $fecha1");

                          control.text = DateFormat('yyyy/MM/dd').format(date);
                          print("fecha es $fecha1 y $fecha2");
                          if (fecha1 != null && fecha2 != null) {
                            var f1 = fecha2.isBefore(fecha1);
                            var f2 = fecha2.difference(fecha1);
                            if (f1 == true || f2.inDays == 0) {
                              bfecha = true;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    title: Text(pre.idioma
                                        ? "Informacion"
                                        : "Information"),
                                    content: Text(pre.idioma
                                        ? "La fecha de salida no puede ser igual o inferior a la de entrada"
                                        : "The departure date cannot be equal to or less than the arrival date"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            // llave.currentState.validate();
                                          },
                                          child: Text("Ok")),
                                    ],
                                  );
                                },
                              );
                            } else {
                              bfecha = false;
                              // llave.currentState.validate();
                            }
                          }
                        },
                        onSaved: (value) => checkin.fechae = value,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        maxLines: 1,
                        controller: control2,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.date_range,
                            color: Color.fromRGBO(40, 48, 79, 1),
                            size: 30,
                          ),
                          labelText:
                              pre.idioma ? "Fecha de salida" : "Check out date",
                          // border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Texto vacio";
                          } else {
                            if (bfecha == true) {
                              return pre.idioma
                                  ? "La fecha no puede ser igual o inferior a la de entrada"
                                  : "The date cannot be equal to or less than the entry date";
                            } else {
                              return null;
                            }
                          }
                        },
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          final dato2 = await selectDate(context);
                          pre.active = false;

                          fecha2 = dato2;
                          print("este es el dato2 $fecha2");
                          control2.text = DateFormat('yyyy/MM/dd').format(date);

                          if (fecha1 != null && fecha2 != null) {
                            var f1 = fecha2.isBefore(fecha1);
                            var f2 = fecha2.difference(fecha1);
                            if (f1 == true || f2.inDays == 0) {
                              bfecha = true;

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    title: Text("Informacion"),
                                    content: Text(pre.idioma
                                        ? "La fecha de salida no puede ser igual o inferior a la de entrada"
                                        : "The departure date cannot be equal to or less than the arrival date"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            // llave.currentState.validate();
                                          },
                                          child: Text("Ok")),
                                    ],
                                  );
                                },
                              );
                            } else {
                              bfecha = false;
                              // llave.currentState.validate();
                            }
                          }
                        },
                        onSaved: (value) => checkin.fechas = value,
                      ),
                      SizedBox(
                        height: 40,
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
                          labelText: pre.idioma
                              ? "Fotos del documento"
                              : "photos of the document",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return pre.idioma
                                ? "Por favor cargue una foto"
                                : "Please upload a photo";
                          } else {
                            return null;
                          }
                        },
                        onTap: () async {
                          FocusScope.of(context).requestFocus(new FocusNode());

                          print(pre.ruta);
                          print(pre.ruta2);
                          pre.active = false;
                          pre.cargandofoto = true;
                          Navigator.pushNamed(context, "foto1",
                              arguments: checkin);
                        },
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
                              child: pre.bck == false
                                  ? Text(pre.idioma
                                      ? "Enviar Check-In"
                                      : "Send Check-In")
                                  : Text(pre.idioma
                                      ? "Guardar Check-In"
                                      : "Save Check-In")),
                          color: Color.fromRGBO(40, 48, 79, 1),
                          textColor: Colors.white,
                          onPressed: () async {
                            print("ruta es ${pre.ruta}");

                            checkin.fotourl1 = pre.rutanet;
                            checkin.fotourl2 = pre.rutanet2;
                            checkin.nident = controlcc.text;
                            checkin.hab = "esperando asignacion";
                            checkin.enc = true;
                            if (!llave.currentState.validate()) return;

                            llave.currentState.save();
                            if (checkin.id != null) {
                              checkinprovider.editartitular(checkin);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    title: Text(pre.idioma
                                        ? "Informacion"
                                        : "Information"),
                                    content: Text(pre.idioma
                                        ? "Su checkin ha sido editado"
                                        : "Your checkin has been edited"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, "homehuesped");
                                          },
                                          child: Text("Ok")),
                                    ],
                                  );
                                },
                              );
                            } else {
                              checkinprovider.crearsolicitudtitular(checkin);
                              encm.enc = false;
                              encm.estado = "Pendiente";
                              checkinprovider.crearenc(encm);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    title: Text(
                                      pre.idioma
                                          ? "Informacion"
                                          : "Information",
                                      style: TextStyle(
                                          fontFamily: "evel",
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    content: Text(
                                      pre.idioma
                                          ? "Su checkin ha sido exitoso"
                                          : "Your checkin has been successful",
                                      style: TextStyle(
                                          fontFamily: "evel",
                                          color: Color.fromRGBO(40, 48, 79, 1),
                                          fontSize: 15),
                                    ),
                                    actions: <Widget>[
                                      MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
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

                            pre.boton = true;
                          }),
                    ],
                  ))))),
    );
  }

  Future selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: now,
        lastDate: DateTime(2040),
        locale: Locale('es', 'ES'),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(primaryColor: Colors.green),
            child: child,
          );
        });

    if (picked != null) {
      setState(() {
        date = picked;
      });
      return picked;
    } else {
      setState(() {
        date = DateTime.now();
      });
      return date;
    }
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
                      Text(
                        pre.idioma
                            ? "Cedula de ciudadania"
                            : "citizenship card",
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
                    controlcc.text = pre.idioma
                        ? "Cedula de ciudadania"
                        : "citizenship card";
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
                      Text(
                        pre.idioma ? "Cedula de Extranjeria" : "Foreigner ID",
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
                    controlcc.text =
                        pre.idioma ? "Cedula de Extranjeria" : "Foreigner ID";
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
                      Text(
                        pre.idioma ? "Pasaporte" : "passport",
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
                    controlcc.text = pre.idioma ? "Pasaporte" : "passport";
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
