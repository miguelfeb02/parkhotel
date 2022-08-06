import 'package:flutter/material.dart';
import 'package:parkhotel/src/models/smodel.dart';
import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';
import 'package:parkhotel/src/providers/solicitudes_provider.dart';

class Editsol extends StatefulWidget {
  @override
  EditsolState createState() => EditsolState();
}

class EditsolState extends State<Editsol> {
  final llave = GlobalKey<FormState>();
  final solicitudesprovider = SolicitudesProvider();
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  Solicitudesmodel solicitudes = new Solicitudesmodel();

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    solicitudes.usuario = pre.nombre;
    final Solicitudesmodel solidata = ModalRoute.of(context).settings.arguments;
    if (solidata != null) {
      solicitudes = solidata;
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
              'Datos de Solicitud',
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
                        height: 5,
                      ),
                      TextFormField(
                        enabled: true,
                        readOnly: true,
                        initialValue: "${solicitudes.asunto[0].toUpperCase()}${solicitudes.asunto.substring(1)}",
                        style: TextStyle(
                          fontFamily: "evel",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color.fromRGBO(40, 48, 79, 1),
                        ),
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelStyle:TextStyle(
                            fontFamily: "evel",
                            fontWeight: FontWeight.w500
                            ) ,
                            labelText: "Asunto", border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        enabled: true,
                        readOnly: true,
                        initialValue: solicitudes.descripcion,
                        style: TextStyle(
                          fontFamily: "evel",
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                          color: Color.fromRGBO(40, 48, 79, 1),
                        ),
                        maxLines: 5,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          labelStyle:TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "evel") ,
                          labelText: "Descripcion",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        initialValue:
                            "Esperando respuesta",
                        enabled: true,
                        readOnly: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                         
                          labelStyle:TextStyle(fontFamily: "evel") ,
                          labelText: "Estado de solicitud",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          height: sizes.height * 0.3,
                          width: sizes.width *0.9,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)
                          ),
                        child: 
                          Stack(
                            children: [
                              Positioned(
                      left:sizes.width * 0.3,
                      top:sizes.height * 0.15,
                      child: Text("Cargando foto...",style: TextStyle(
                        fontFamily: "evel",
                        color: Color.fromRGBO(40, 48, 79, 1),
                      ),)),
                              Container(
                                height: sizes.height * 0.3,
                                width: sizes.width *0.9,
                                child: Image(image: NetworkImage(solicitudes.url),
                                fit:BoxFit.fill,),
                              ),
                            ],
                          )
                          
                        ),
                      
                    ],
                  )
                  )
                  ),
                  
                  ),
                  ),
    );
  }
}
