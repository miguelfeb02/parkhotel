import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:parkhotel/src/pages/HUESPED/listacheckin.dart';
// ignore: unused_import


import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/pages/HUESPED/checkout.dart';


class Homehuespedtab extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Homehuespedtab>
    with SingleTickerProviderStateMixin {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final GlobalKey<ScaffoldState> key1 = GlobalKey();
  final GlobalKey keyu = GlobalKey();
  GoogleSignIn cuenta = GoogleSignIn();
  
  @override
  Widget build(BuildContext context) {
    int x = 0;
    final int indice = ModalRoute.of(context).settings.arguments;
    print("indice $indice");
    if (indice != null) {
      x = indice;
    }

    pre.ruta = "0";
    pre.rutasol = "0";
    pre.ruta2 = "0";
    pre.validar = false;
    pre.active = false;
    pre.hab = "HAB : 401";
    return WillPopScope(
      onWillPop: () async {
        dialogo();
        return false;
      },
      child: DefaultTabController(
        key: keyu,
        initialIndex: x,
        length: 2,
        child: Scaffold(
          key: key1,
          // drawer: drawer(),
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  dialogo();
                }),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    key1.currentState.openDrawer();
                  })
            ],
            title: Text(
              'PARK HOTEL APP',
              style: TextStyle(fontFamily: "evel"),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                    child: Text(
                      "Check-In",
                      style: TextStyle(fontFamily: "evel"),
                    ),
                    icon: Icon(Icons.check_circle)),
                Tab(
                    child: Text(
                      "Check-out",
                      style: TextStyle(fontFamily: "evels"),
                    ),
                    icon: Icon(Icons.textsms)),
                // Tab(
                //     child: Text(
                //       "PQR",
                //       style: TextStyle(fontFamily: "evel"),
                //     ),
                //     icon: Icon(Icons.format_align_justify)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Lcheckin(),
              Checkout(),
              //  Pqr(),
            ],
          ),
        ),
      ),
    );
  }


  dialogo() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          title: pre.idioma? Text(
            "Informacion",
            style: TextStyle(color:Color.fromRGBO(40, 48, 79, 1),
                fontFamily: "evel", fontSize: 18, fontWeight: FontWeight.w900),
          ):Text(
            "Information",
            style: TextStyle(color:Color.fromRGBO(40, 48, 79, 1),
                fontFamily: "evel", fontSize: 18, fontWeight: FontWeight.w900),
          ),
          content: pre.idioma? Text(
            "¿Cerrar sesion?",
            style: TextStyle(color:Color.fromRGBO(40, 48, 79, 1),
                fontFamily: "evel", fontSize: 15, fontWeight: FontWeight.w500),
          ):Text(
            "¿Logout?",
            style: TextStyle(color:Color.fromRGBO(40, 48, 79, 1),
                fontFamily: "evel", fontSize: 15, fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Color.fromRGBO(40, 48, 79, 1),
                onPressed: () {
                  cuenta.signOut();
                  Navigator.pushNamed(context, "inicio");
                  pre.token = "inicio";
                },
                child: pre.idioma? Text("Si"):Text("Yes")),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Color.fromRGBO(40, 48, 79, 1),
                
                child: Container(child: Text("No")),
                onPressed: () {
                  Navigator.pop(context);
                },),
          ],
        );
      },
    );
  }
}
