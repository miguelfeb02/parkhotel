import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:parkhotel/src/pages/GENERAL/contrato.dart';
import 'package:parkhotel/src/pages/GENERAL/inicio.dart';
import 'package:parkhotel/src/pages/GENERAL/login.dart';

import 'package:parkhotel/src/pages/GENERAL/paginadecarga1.dart';
import 'package:parkhotel/src/pages/HUESPED/addpqr.dart';
import 'package:parkhotel/src/pages/HUESPED/checkina.dart';

import 'package:parkhotel/src/pages/HUESPED/editsol.dart';
import 'package:parkhotel/src/pages/HUESPED/foto1.dart';
import 'package:parkhotel/src/pages/HUESPED/foto2.dart';

import 'package:parkhotel/src/pages/HUESPED/fotosol.dart';
import 'package:parkhotel/src/pages/HUESPED/homehuespedtab.dart';
import 'package:parkhotel/src/pages/HUESPED/listacheckin.dart';
import 'package:parkhotel/src/pages/HUESPED/loading.dart';



import 'package:parkhotel/src/pages/general/acerca.dart';
import 'package:parkhotel/src/pages/huesped/checkin.dart';
import 'package:parkhotel/src/pages/general/config.dart';

import 'package:parkhotel/src/pages/huesped/addsol.dart';
import 'package:parkhotel/src/pages/general/paginacarga.dart';

import 'package:parkhotel/src/pages/general/register.dart';
import 'package:parkhotel/src/pages/huesped/solicitudeshuesped.dart';
import 'package:parkhotel/src/pages/general/afterlogin.dart';

import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  
  runApp(Miapp());
}

class Miapp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(context) {
    
    return MaterialApp(
        localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        supportedLocales: [const Locale('es'), const Locale('en')],
        title: "Park Hotel",
        debugShowCheckedModeBanner: false,
        initialRoute: prefs.token,
        routes: {
          "inicio": (BuildContext context) => Inicio(),
          "login": (BuildContext context) => Login(),
          "homehuesped": (BuildContext context) => Homehuespedtab(),
          
          "checkin": (BuildContext context) => Checkin(),
          "checkina": (BuildContext context) => Checkina(),
          "lcheckin": (BuildContext context) => Lcheckin(),
          "solicitudes": (BuildContext context) => Solicitudes(),
          
          "config": (BuildContext context) => Config(),
          "acerca": (BuildContext context) => Acerca(),
          "listasolicitudes": (BuildContext context) => ListaSolicitudes(),
          "editsol": (BuildContext context) => Editsol(),
          "addpqr": (BuildContext context) => Addpqr(),
          "registro": (BuildContext context) => Register2(),
          "pagina": (BuildContext context) => Paginadecarga(),
          "pagina1": (BuildContext context) => Paginadecarga1(),
          "afterlogin": (BuildContext context) => Afterlogin(),
          "foto1": (BuildContext context) => Foto1(),
          "foto2": (BuildContext context) => Foto2(),
          "fotosol": (BuildContext context) => Fotosol(),
          "loading": (BuildContext context) => Loading(),
          "contrato": (BuildContext context) => Contrato(),
        },
        theme: ThemeData(
          brightness: Brightness.light, 
          primaryColor: Color.fromRGBO(40, 48, 79, 1), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(40, 48, 79, 1)),
        ));
  }
}
