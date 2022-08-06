import 'package:flutter/material.dart';
import 'package:parkhotel/src/models/cmodel.dart';

import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/checkin_provider.dart';

class Lcheckin extends StatefulWidget {
  @override
  LcheckinState createState() => LcheckinState();
}

class LcheckinState extends State<Lcheckin> {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final checkinprovider = CheckinProvider();
  bool vista;
  Checkinmodel checkin = new Checkinmodel();
  bool haydata;
  bool enable;

  @override
  Widget build(BuildContext context) {
    pre.pesofoto1 = "";
    pre.pesofoto2 = "";
    final sizes = MediaQuery.of(context).size;
    print(pre.cargandofoto);
    pre.cargandofoto = true;
    print(pre.cargandofoto);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, "homehuesped");
        return false;
      },
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                height: sizes.height * 1,
                width: sizes.width * 1,
                color: Colors.transparent,
              ),
              Positioned(
                top: sizes.height * 0.01,
                child: Container(
                  height: sizes.height * 0.05,
                  width: sizes.width * 1,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(40, 48, 79, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(40, 48, 79, 1),
                        blurRadius: 6.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(1.0, 0.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        width: sizes.width * 0.1,
                      ),
                      pre.idioma?
                      Text(
                        "Huesped Titular",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "evel",
                            fontSize: 16),
                      ):Text(
                        "Titular Guest",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "evel",
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: sizes.width * 0.2,
                      ),
                      pre.boton == true
                          ? SizedBox(
                              width: sizes.width * 0.1,
                            )
                          : botonagregar(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: sizes.height * 0.065,
                child: Container(
                    height: sizes.height * 0.15,
                    width: sizes.width * 1,
                    child: pre.boton == true ? huespedtitular() : tarjeta1()),
              ),
              Positioned(
                top: sizes.height * 0.22,
                child: Container(
                  height: sizes.height * 0.05,
                  width: sizes.width * 1,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(40, 48, 79, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(40, 48, 79, 1),
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(0.0, 0.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        width: sizes.width * 0.1,
                      ),
                     pre.idioma? Text(
                        "Acompañantes",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "evel",
                            fontSize: 16),
                      ): Text(
                        "Companions",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "evel",
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: sizes.width * 0.21,
                      ),
                      MaterialButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: sizes.width * 0.01,
                              ),
                             pre.idioma? Text(
                                "Agregar",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontFamily: "evel"),
                              ):Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontFamily: "evel"),
                              ),
                            ],
                          ),
                          onPressed: () {
                            pre.bck = false;
                            pre.active = false;
                            pre.activefotos = false;
                            if (pre.boton == true) {
                              Navigator.pushNamed(context, "checkina");
                            } else {
                              mensajeboton();
                            }
                          })
                    ],
                  ),
                ),
              ),
              Positioned(
                top: sizes.height * 0.29,
                child: Container(
                    height: sizes.height * 0.43,
                    width: sizes.width * 1,
                    child: huespedacom()),
              ),
            ],
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
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(40, 48, 79, 1),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

//--------------------------------------------------------------------------
  Widget crearitemtitular(Checkinmodel datocheck) {
    final sizes = MediaQuery.of(context).size;
    return Container(
      height: sizes.height * 0.15,
      width: sizes.width * 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            ListTile(
              onTap: () {
                menopciontitular(datocheck);
              },
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              leading: SizedBox(
                width: 10,
                child: Container(
                  color: Color.fromRGBO(40, 48, 79, 1),
                ),
              ),
              trailing: SizedBox(
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.image,
                        size: 45,
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),
                      Icon(
                        Icons.check_box,
                        size: 45,
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),
                    ],
                  ),
                ),
              ),
              title: Text(
                "${datocheck.nombre[0].toUpperCase()}${datocheck.nombre.substring(1)}",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(40, 48, 79, 1),
                    fontFamily: 'evel',
                    fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                "C.C. ${datocheck.ident}",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(40, 48, 79, 1),
                  fontFamily: 'evel',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget crearitemacom(Checkinmodel datocheck) {
    final sizes = MediaQuery.of(context).size;
    return Container(
      height: sizes.height * 0.15,
      width: sizes.width * 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        elevation: 10,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            ListTile(
              onTap: () {
                menopcionacom(datocheck);
              },
              contentPadding: EdgeInsets.only(left: 10, right: 10),
              leading: SizedBox(
                width: 10,
                child: Container(
                  color: Color.fromRGBO(40, 48, 79, 1),
                ),
              ),
              trailing: SizedBox(
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.image,
                        size: 45,
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),
                      Icon(
                        Icons.check_box,
                        size: 45,
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),
                    ],
                  ),
                ),
              ),
              title: Text(
                "${datocheck.nombre[0].toUpperCase()}${datocheck.nombre.substring(1)}",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(40, 48, 79, 1),
                    fontFamily: 'elve',
                    fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                "C.C. ${datocheck.ident}",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  fontSize: 13,
                  color: Color.fromRGBO(40, 48, 79, 1),
                  fontFamily: 'evel',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  huespedtitular() {
    return FutureBuilder(
      future: checkinprovider.cargarsolicitudtitular(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Checkinmodel>> snapshot) {
        if (snapshot.hasData) {
          final datacheck = snapshot.data;

          if (datacheck.length == 1) {
            haydata = true;
          } else {
            haydata = false;
          }
          // print(" hay datos titular $haydata");
          // print(" items de titular ${datacheck.length}");
          enable = true;
          return ListView.builder(
            reverse: false,
            itemCount: datacheck.length ,
            itemBuilder: (context, i) => crearitemtitular(datacheck[i]),
          );
        } else {
          enable = false;
          return Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.green)));
        }
      },
    );
  }

  Widget huespedacom() {
    return FutureBuilder(
      future: checkinprovider.cargarsolicitudacompanantes(),
      builder:
          (BuildContext context, AsyncSnapshot<List<Checkinmodel>> snapshot) {
        if (snapshot.hasData) {
          final datacheck = snapshot.data;

          if (datacheck.length >0 ) {
            pre.numacom = true;
            print("es ${pre.numacom}");
          } else {
            pre.numacom = false;
            print("es ${pre.numacom}");
          }
          return ListView.builder(
            reverse: false,
            itemCount:datacheck.length,
            itemBuilder: (context, i) => crearitemacom(datacheck[i]),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.green)));
        }
      },
    );
  }

  Widget tarjeta1() {
    final sizes = MediaQuery.of(context).size;
    enable = true;
    return Container(
        height: sizes.height * 0.15,
        width: sizes.width * 1,
        child: Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 3,
                  color: Color.fromRGBO(40, 48, 79, 1),
                ),
                borderRadius: BorderRadius.circular(5)),
            color: Colors.white,
            elevation: 15,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: MaterialButton(
                  child: Column(
                    children: [
                      SizedBox(
                        height: sizes.height * 0.038,
                      ),
                      //  Icon(Icons.add_circle,color: Color.fromRGBO(40, 48, 79, 1),),
                      Text(pre.idioma?
                        " Presiona agregar para realizar checkin":"Press add to check in",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(40, 48, 79, 1),
                            fontFamily: "OpenSans"),
                      ),
                    ],
                  ),
                  onPressed: () {
                    pre.bck = false;
                    pre.active = false;
                    pre.activefotos = false;
                    Navigator.pushNamed(context, "checkin");
                  }),
            )));
  }

  mensajeboton() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          title: Text(pre.idioma?
            "Informacion":"Information",
            style: TextStyle(
                color: Color.fromRGBO(40, 48, 79, 1),
                fontFamily: "evel",
                fontSize: 18,
                fontWeight: FontWeight.w900),
          ),
          content: Text(pre.idioma?
            "Primero debe diligenciar el checkin del huesped titular":"You must first complete the check-in of the titular guest",
            style: TextStyle(
                color: Color.fromRGBO(40, 48, 79, 1),
                fontFamily: "evel",
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Color.fromRGBO(40, 48, 79, 1),
              child: Container(child: Text("Ok")),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  botonagregar() {
    final sizes = MediaQuery.of(context).size;
    return MaterialButton(
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
            SizedBox(
              width: sizes.width * 0.01,
            ),
           pre.idioma? Text(
              "Agregar",
              style: TextStyle(
                  fontSize: 13, color: Colors.white, fontFamily: "evel"),
            ):Text(
              "Add",
              style: TextStyle(
                  fontSize: 13, color: Colors.white, fontFamily: "evel"),
            ),
          ],
        ),
        onPressed: () {
          pre.bck = false;
          pre.activefotos = false;
          pre.active = false;
          Navigator.pushNamed(context, "checkin");
        });
  }

  menopciontitular(checkin) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: Container(
            height: 100,
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        FloatingActionButton(
                            heroTag: "b1",
                            child: Icon(
                              Icons.edit,
                            ),
                            elevation: 10,
                            onPressed: () async {
                              pre.bck = true;
                              pre.active = true;
                              pre.activefotos = true;
                              Navigator.pushNamed(context, "checkin",
                                  arguments: checkin);
                            }),
                        SizedBox(height: 10),
                        Text(pre.idioma?
                          "Editar":"Edit",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "evel",
                            color: Color.fromRGBO(40, 48, 79, 1),
                          ),
                        )
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     FloatingActionButton(
                    //         heroTag: "b2",
                    //         child: Icon(
                    //           Icons.delete,
                    //         ),
                    //         elevation: 10,
                    //         onPressed: () async {
                    //           if (pre.numacom == false) {
                    //             final elimino =
                    //                 await checkinprovider.borrartitular();
                    //             Navigator.pop(context);
                    //             if (elimino == true) {
                    //               setState(() {
                    //                 pre.boton = false;
                    //               });
                    //             }
                    //           } else {
                    //             showDialog(
                    //               context: context,
                    //               builder: (context) {
                    //                 return AlertDialog(
                    //                   elevation: 20,
                    //                   shape: RoundedRectangleBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(6)),
                    //                   title: Text(pre.idioma?
                    //                     "Informacion":"Information",
                    //                     style: TextStyle(
                    //                       fontFamily: "evel",
                    //                       color: Color.fromRGBO(40, 48, 79, 1),
                    //                     ),
                    //                   ),
                    //                   content: Text(pre.idioma?
                    //                     "Primero debe borrar sus acompañantes":"You must first delete your companions",
                    //                     style: TextStyle(
                    //                       fontFamily: "evel",
                    //                       color: Color.fromRGBO(40, 48, 79, 1),
                    //                     ),
                    //                   ),
                    //                   actions: <Widget>[
                    //                     TextButton(
                    //                         onPressed: () {
                    //                           Navigator.pop(context);
                    //                           Navigator.pop(context);
                    //                         },
                    //                         child: Text("Ok")),
                    //                   ],
                    //                 );
                    //               },
                    //             );
                    //           }
                    //         }),
                    //     SizedBox(height: 10),
                    //     Text(pre.idioma?
                    //       "Eliminar":"Delete",
                    //       style: TextStyle(
                    //         fontSize: 13,
                    //         fontFamily: "evel",
                    //         color: Color.fromRGBO(40, 48, 79, 1),
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
          actions: [],
        );
      },
    );
  }

  menopcionacom(checkin) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          content: Container(
            height: 100,
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        FloatingActionButton(
                            heroTag: "b1",
                            child: Icon(
                              Icons.edit,
                            ),
                            elevation: 10,
                            onPressed: () async {
                              pre.bck = true;
                              pre.activefotos = true;
                              pre.active = true;
                              Navigator.pushNamed(context, "checkina",
                                  arguments: checkin);
                            }),
                        SizedBox(height: 10),
                        Text(pre.idioma?
                          "Editar":"Edit",
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
                              Icons.delete,
                            ),
                            elevation: 10,
                            onPressed: () async {
                              final elimino =
                                  await checkinprovider.borraracom(checkin.id);
                              Navigator.pop(context);
                              if (elimino == true) {
                                setState(() {});
                              }
                            }),
                        SizedBox(height: 10),
                        Text(pre.idioma?
                          "Eliminar":"Delete",
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
          actions: [],
        );
      },
    );
  }
}
