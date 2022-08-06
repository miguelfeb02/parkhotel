import 'package:flutter/material.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/checkin_provider.dart';
import 'package:parkhotel/src/models/encmodel.dart';

// ignore: must_be_immutable
class Afterlogin extends StatefulWidget {
  @override
  _AfterloginState createState() => _AfterloginState();
}

class _AfterloginState extends State<Afterlogin> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();

  final checkinprovider = CheckinProvider();

  Encmodel encm = new Encmodel();

  @override
  Widget build(BuildContext context) {
    haytitular();
   
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "inicio");
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(pre.foto),
                  radius: 60,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 40),
                pre.idioma
                    ? Text(
                        'Nombre',
                        style: TextStyle(
                            fontFamily: "evel",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      )
                    : Text(
                        'Name',
                        style: TextStyle(
                            fontFamily: "evel",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                Text(
                  "${pre.nombre.toUpperCase()}",
                  style: TextStyle(
                      fontFamily: "evel",
                      fontSize: 25,
                      color: Color.fromRGBO(40, 48, 79, 1),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Email',
                  style: TextStyle(
                      fontFamily: "evel",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  pre.correoreal,
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(40, 48, 79, 1),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "pagina");
                  },
                  color: Color.fromRGBO(40, 48, 79, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: pre.idioma
                        ? Text(
                            'Continuar',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        : Text(
                            'Continue',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                  ),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  haytitular() async {
    final dato = await checkinprovider.cargarsolicitudtitular();
    if (dato.length >= 1) {
      pre.boton = true;
    } else {
      pre.boton = false;
    }
  }

  
}
