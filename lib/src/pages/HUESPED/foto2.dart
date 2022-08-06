import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

import 'package:parkhotel/src/models/cmodel.dart';

import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/checkin_provider.dart';

class Foto2 extends StatefulWidget {
  @override
  _Foto2State createState() => _Foto2State();
}

class _Foto2State extends State<Foto2> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  Checkinmodel persona = new Checkinmodel();
  final checkinprovider = CheckinProvider();
  File foto1, foto2;

  double progres;
  String x;
  double progresf;
  double progresf1;
  String porcentaje;
  bool p;

  @override
  Widget build(BuildContext context) {
    print("activefotos esta ${pre.activefotos}");

    // ignore: unused_local_variable
    final Checkinmodel checkindata2 = ModalRoute.of(context).settings.arguments;
    

    if (pre.ruta != "0" && pre.ruta2 != "0") {
      foto1 = File(pre.ruta);
      foto2 = File(pre.ruta2);
    }

    print("active ${pre.active}");
    print(pre.cargandofoto);
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: Text(
          'Foto Documento acompañante',
        ),
      ),
      body: pre.cargandofoto == false
          ? Center(
              child: Column(
              children: [
                SizedBox(
                  height: sizes.height * 0.4,
                ),
                CircularProgressIndicator(
                    value: progres != 0.0 ? progres : null,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(40, 48, 79, 1),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Subiendo Fotos")
              ],
            ))
          : Column(
              children: [
                SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mostrarimagen1(checkindata2.fotourl1),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        child:Container(
                          height: sizes.height * 0.3,
                          width: sizes.width * 0.8,
                          color: Color.fromRGBO(40, 48, 79, 1),
                        ),
                        
                        height: 15),
                    SizedBox(
                      height: 10,
                    ),
                    mostrarimagen2(checkindata2.fotourl2),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                        child:Container(
                          height: sizes.height * 0.3,
                          width: sizes.width * 0.8,
                          color: Color.fromRGBO(40, 48, 79, 1),
                        ),
                        
                        height: 15),
                Divider(
                  height: 30,
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                // ignore: deprecated_member_use
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                      child: Text("Continuar"),
                    ),
                    color: Color.fromRGBO(40, 48, 79, 1),
                    textColor: Colors.white,
                    onPressed: () async {
                      if (pre.activefotos == true) {
                        Navigator.pop(context);
                      } else {
                        if (pre.ruta != "0" && pre.ruta2 != "0") {
                          pre.cargandofoto = false;
                          final fototrue1 = await subirfoto1(foto1);
                          final fototrue2 = await subirfoto2(foto2);
                          if (fototrue1 == true && fototrue2 == true) {
                            pre.validar = true;
                            pre.cargandofoto = true;
                            Navigator.pop(context);
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                title: Text("Informacion"),
                                content: Text(
                                    "Por favor llena los campos (foto cara y foto respaldo)"),
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
                      }
                    }),
              ],
            ),
    );
  }

  mostrarimagen1(check) {
    final sizes = MediaQuery.of(context).size;
    return MaterialButton(
      child: Container(
        child: Stack(
          children: [
            Positioned(
                      left:sizes.width * 0.3,
                      top:sizes.height * 0.15,
                      child: Text("Cargando foto...",style: TextStyle(
                        fontFamily: "evel",
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),)),
            pre.activefotos == false
                ? Image(
                    image: pre.ruta != "0"
                        ? FileImage(File(pre.ruta))
                        : AssetImage('recursos/1.jpg'),
                    height: sizes.height * 0.3,
                    width: sizes.width * 0.8,
                    fit: BoxFit.fill)
                : Image(
                    image: pre.ruta != "0"
                        ? FileImage(File(pre.ruta))
                        : NetworkImage(check),
                    height: sizes.height * 0.3,
                    width: sizes.width * 0.8,
                    fit: BoxFit.cover),
          ],
        ),
      ),
      onPressed: () {
        fuente1();
      },
    );
  }

  mostrarimagen2(check) {
    final sizes = MediaQuery.of(context).size;
    return MaterialButton(
      child: Container(
        child: Stack(
          children: [
            Positioned(
                      left:sizes.width * 0.3,
                      top:sizes.height * 0.15,
                      child: Text("Cargando foto...",style: TextStyle(
                        fontFamily: "evel",
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),)),
            pre.activefotos == false
                ? Image(
                    image: pre.ruta2 != "0"
                        ? FileImage(File(pre.ruta2))
                        : AssetImage('recursos/2.jpg'),
                    height: sizes.height * 0.3,
                    width: sizes.width * 0.8,
                    fit: BoxFit.fill)
                : Image(
                    image: pre.ruta2 != "0"
                        ? FileImage(File(pre.ruta2))
                        : NetworkImage(check),
                    height: sizes.height * 0.3,
                    width: sizes.width * 0.8,
                    fit: BoxFit.cover),
          ],
        ),
      ),
      onPressed: () {
        fuente2();
      },
    );
  }

  seleccionarfoto1() async {
    Navigator.pop(context);
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      imageQuality: 30,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      pre.activefotos = false;
      foto1 = File(pickedFile.path);
      pre.ruta = foto1.path;

      String h = foto1.lengthSync().toString();
      int k = h.length;

      pre.pesofoto1 = h.replaceRange(k - 3, k, "");
      print("$foto1 - ${foto1.path}");

      setState(() {});
    }
  }

  seleccionarfoto2() async {
    Navigator.pop(context);
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      imageQuality: 30,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      pre.activefotos = false;
      foto2 = File(pickedFile.path);
      pre.ruta2 = foto2.path;

      String h = foto2.lengthSync().toString();
      int k = h.length;

      pre.pesofoto2 = h.replaceRange(k - 3, k, "");
      print("$foto2 - ${foto2.path}");

      setState(() {});
    }
  }

  tomarfoto1() async {
    Navigator.pop(context);
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      imageQuality: 30,
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      pre.activefotos = false;
      foto1 = File(pickedFile.path);
      String h = foto1.lengthSync().toString();
      int k = h.length;

      pre.pesofoto1 = h.replaceRange(k - 3, k, "");

      pre.ruta = foto1.path;
      print("$foto1 - ${foto1.path}");

      setState(() {});
    }
  }

  tomarfoto2() async {
    Navigator.pop(context);
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      imageQuality: 30,
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      pre.activefotos = false;
      foto2 = File(pickedFile.path);
      String h = foto2.lengthSync().toString();
      int k = h.length;

      pre.pesofoto2 = h.replaceRange(k - 3, k, "");

      pre.ruta2 = foto2.path;
      print("$foto2 - ${foto2.path}");

      setState(() {});
    }
  }

  Future<bool> subirfoto1(File imagen) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('${pre.correo}/titular/${Path.basename(imagen.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(imagen);
    p = uploadTask.isInProgress;

    uploadTask.events.listen((event) {
      setState(() {
        progres = event.snapshot.bytesTransferred.toDouble() /
            event.snapshot.totalByteCount.toDouble();
        x = progres.toStringAsFixed(1);
        progresf = double.parse(x);
        if (progresf != 0.0) {
          progresf1 = progresf * 100;
          porcentaje = progresf1.toStringAsFixed(0);
        } else {
          porcentaje = "0";
        }
      });
    });

    await uploadTask.onComplete;
    print("subio $imagen");
    storageReference.getDownloadURL().then((fileURL) {
      pre.rutanet = fileURL;
    });
    return true;
  }

  Future<bool> subirfoto2(File imagen) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('${pre.correo}/titular/${Path.basename(imagen.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(imagen);
    p = uploadTask.isInProgress;

    uploadTask.events.listen((event) {
      setState(() {
        progres = event.snapshot.bytesTransferred.toDouble() /
            event.snapshot.totalByteCount.toDouble();
        x = progres.toStringAsFixed(1);
        progresf = double.parse(x);
        if (progresf != 0.0) {
          progresf1 = progresf * 100;
          porcentaje = progresf1.toStringAsFixed(0);
        } else {
          porcentaje = "0";
        }
      });
    });

    await uploadTask.onComplete;
    print("subio $imagen");
    storageReference.getDownloadURL().then((fileURL) {
      pre.rutanet2 = fileURL;
    });
    return true;
  }

  dialogo() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          title: Text("Informacion"),
          content: Text("Seleccione"),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "fotocedu2");
                },
                child: Text("Ok")),
          ],
        );
      },
    );
  }

  fuente1() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Text(
                  "Foto cara documento",
                  style: TextStyle(
                    fontFamily: "evel",
                    color: Color.fromRGBO(40, 48, 79, 1),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        FloatingActionButton(
                            heroTag: "b1",
                            child: Icon(
                              Icons.camera_alt,
                            ),
                            elevation: 10,
                            onPressed: () async {
                              tomarfoto1();
                            }),
                        SizedBox(height: 10),
                        Text(
                          "Desde la camara",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "evel",
                            color: Color.fromRGBO(40, 48, 79, 1),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FloatingActionButton(
                            heroTag: "b2",
                            child: Icon(
                              Icons.image,
                            ),
                            elevation: 10,
                            onPressed: () async {
                              seleccionarfoto1();
                            }),
                        SizedBox(height: 10),
                        Text(
                          "Desde la galeria",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "evel",
                            color: Color.fromRGBO(40, 48, 79, 1),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  fuente2() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: Container(
            height: 120,
            child: Column(
              children: [
                Text(
                  "Foto respaldo documento",
                  style: TextStyle(
                    fontFamily: "evel",
                    color: Color.fromRGBO(40, 48, 79, 1),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        FloatingActionButton(
                            heroTag: "b1",
                            child: Icon(
                              Icons.camera_alt,
                            ),
                            elevation: 10,
                            onPressed: () async {
                              tomarfoto2();
                            }),
                        SizedBox(height: 10),
                        Text(
                          "Desde la camara",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "evel",
                            color: Color.fromRGBO(40, 48, 79, 1),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        FloatingActionButton(
                            heroTag: "b2",
                            child: Icon(
                              Icons.image,
                            ),
                            elevation: 10,
                            onPressed: () async {
                              seleccionarfoto2();
                            }),
                        SizedBox(height: 10),
                        Text(
                          "Desde la galeria",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "evel",
                            color: Color.fromRGBO(40, 48, 79, 1),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
