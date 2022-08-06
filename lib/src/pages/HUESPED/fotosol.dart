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

class Fotosol extends StatefulWidget {
  @override
  _FotosolState createState() => _FotosolState();
}

class _FotosolState extends State<Fotosol> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  Checkinmodel persona = new Checkinmodel();
  final checkinprovider = CheckinProvider();
  File foto;
  double progres;
  String x;
  double progresf;
  double progresf1;
  String porcentaje;
  bool p;
  String o;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        title: Text(
          'Imagen del documento',
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
                    semanticsLabel: "dsd",
                    value: progres != 0.0 ? progres : null,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(40, 48, 79, 1),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Subiendo Foto $porcentaje %")
              ],
            ))
          : Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mostrarimagen(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    child: foto == null
                        ? Text("0 KB")
                        : Text("$o KB"),
                    height: 15),
                Divider(
                  height: 40,
                  color: Colors.black,
                ),
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
                              tomarfoto();
                            }),
                        SizedBox(height: 10),
                        Text("Desde la camara")
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
                              seleccionarfoto();
                            }),
                        SizedBox(height: 10),
                        Text("Desde la galeria")
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    
                    child: Container(
                      color: Color.fromRGBO(40, 48, 79, 1),
                      padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                      child: Text("Aceptar"),
                    ),
                    
                    
                    onPressed: () async {
                      if (pre.rutasol != "0") {
                        pre.validar = true;
                        print(foto);
                        
                        pre.cargandofoto = false;
                        
                        final fototrue = await subirfotosol(foto);
                        print(pre.rutanetsol);

                        if (fototrue == true) {
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
                              content:
                                  Text("Debe seleccionar o tomar una foto"),
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
                    }),
              ],
            ),
    );
  }

  mostrarimagen() {
    final sizes = MediaQuery.of(context).size;
    
      return Image(
        image: foto != null
            ? FileImage(foto)
            : AssetImage('recursos/no-image.png'),
        height: sizes.height * 0.4,
        width: sizes.width * 0.9,
        fit: BoxFit.cover,
      );
    
  }

  seleccionarfoto() async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      imageQuality: 30,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      foto = File(pickedFile.path);
      pre.rutasol = foto.path;
      print(foto.path);
      String h = foto.lengthSync().toString();
      int k = h.length;

      o = h.replaceRange(k - 3, k, "");
      if (foto != null) {
        persona.fotourl1 = null;
        persona.fotourl2 = null;
      }
      setState(() {});
    }
  }

  tomarfoto() async {
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      imageQuality: 30,
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      foto = File(pickedFile.path);
      String h = foto.lengthSync().toString();
      int k = h.length;

      o = h.replaceRange(k - 3, k, "");

      pre.rutasol = foto.path;
      print(foto.path);

      if (foto != null) {
        persona.fotourl1 = null;
        persona.fotourl2 = null;
      }
      setState(() {});
    }
  }

  Future<bool> subirfotosol(File imagen) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('${pre.correo}/solicitudes/${Path.basename(imagen.path)}}');
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
    print("foto cedula subida");
    storageReference.getDownloadURL().then((fileURL) {
      pre.rutanetsol = fileURL;
    });
    return true;
  }
}
