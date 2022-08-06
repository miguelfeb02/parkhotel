import 'package:parkhotel/src/models/smodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';

class SolicitudesProvider {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final String _url = 'https://parkhotelapp123.firebaseio.com';

  Future<bool> crearsolicitud(Solicitudesmodel solicitudesmodel) async {
    String usuario = pre.correo;
    
    final url ='$_url/Usuarios/${usuario.toUpperCase()}/Solicitudes.json';

    final resp =
        await http.post(url, body: solicitudesmodelToJson(solicitudesmodel));

    final data = json.decode(resp.body);

    print(data);

    return true;
  }

  Future<List<Solicitudesmodel>> cargarsolicitud() async {
    String usuario = pre.correo;
    
    final url = '$_url/Usuarios/${usuario.toUpperCase()}/Solicitudes.json';
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<Solicitudesmodel> solicitud = [];

    if (data == null) {
      return [];
    }
    data.forEach((id, soli) {
      // print(soli);
      final solitemp = Solicitudesmodel.fromJson(soli);

      solicitud.add(solitemp);
    });

    return solicitud;
  }

  Future<List> cargarsolicitudtotal() async {
    final url = '$_url/Usuarios.json';
    final resp = await http.get(url);
    final data = json.decode(resp.body);
    final list = [];

    for (var k in data.keys) {
      list.add(k);
    }
    return list;
  }

  Future<List<Solicitudesmodel>> cargarsolicitudparcial(usuariox) async {
    
    final url = '$_url/Usuarios/$usuariox.json';
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<Solicitudesmodel> solicitud = [];

    if (data == null) {
      return [];
    }
    data.forEach((id, soli) {
      // print(soli);
      final solitemp = Solicitudesmodel.fromJson(soli);

      solicitud.add(solitemp);
    });

    return solicitud;
  }
}
