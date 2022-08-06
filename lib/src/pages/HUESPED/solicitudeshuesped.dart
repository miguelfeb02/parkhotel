import 'package:flutter/material.dart';

import 'package:parkhotel/src/models/smodel.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/solicitudes_provider.dart';

class Solicitudes extends StatefulWidget {
  @override
  _SolicitudesState createState() => _SolicitudesState();
}

class _SolicitudesState extends State<Solicitudes> {
  final solicitudesprovider = new SolicitudesProvider();
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final solicitudesmodel = new Solicitudesmodel();

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "homehuesped");
        return false;
      },
      child: Scaffold(
        body: Container(
          height: sizes.height * 1,
          width: sizes.width * 1,
          child: FutureBuilder(
            future: solicitudesprovider.cargarsolicitud(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Solicitudesmodel>> snapshot) {
              if (snapshot.hasData) {
                final solicitudes = snapshot.data;

                return ListView.builder(
                  reverse: false,
                  itemCount: solicitudes.length,
                  itemBuilder: (context, i) => crearitem(solicitudes[i]),
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.green)));
              }
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color.fromRGBO(40, 48, 79, 1),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                color: Color.fromRGBO(40, 48, 79, 1),
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            backgroundColor: Color.fromRGBO(40, 48, 79, 1),
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, "listasolicitudes");
            }),
      ),
    );
  }

  Widget crearitem(Solicitudesmodel solicitud) {
    // ignore: unused_local_variable
    final sizes = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 90,
        child: Stack(
          children: [
            Positioned(
                left: sizes.width * 0.75,
                top: sizes.height * 0.02,
                child: Container(
                    child: Icon(
                      Icons.data_usage,
                      size: 40,
                    ),
                    width: 40,
                    height: 40,
                    color: Colors.transparent)),
            Positioned(
                top: 2,
                left: 1,
                child: SizedBox(
                  width: 15,
                  height: 88,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(40, 48, 79, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            bottomLeft: Radius.circular(60))),
                  ),
                )),
            Positioned(
              top: 5,
              left: 20,
              child: SizedBox(
                width: sizes.width * 0.65,
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "editsol",arguments: solicitud);
                    pre.active = true;
                  },
                  title: Text(
                    "${solicitud.asunto[0].toUpperCase()}${solicitud.asunto.substring(1)}",
                    style: TextStyle(
                        color: Color.fromRGBO(40, 48, 79, 1),
                        fontFamily: "evel",
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    "${solicitud.descripcion}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                      color: Color.fromRGBO(40, 48, 79, 1),
                      fontFamily: "evel",
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: sizes.height * 0.08,
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    SizedBox(
                      width: sizes.width * 0.70,
                    ),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(40, 48, 79, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "En espera",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "evel",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
