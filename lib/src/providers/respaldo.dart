import 'package:parkhotel/src/models/cmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';

class CheckinProvider {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final String _url = 'https://parkhotelapp123.firebaseio.com';

  Future<bool> crearsolicitudtitular(Checkinmodel checkinmodel) async {
    String usuario = pre.correo;

    final url = '$_url/Usuarios/${usuario.toUpperCase()}/Checkin/titular.json';

    final resp = await http.post(url, body: checkinmodelToJson(checkinmodel));

    final data = json.decode(resp.body);

    print(data);

    return true;
  }

  Future<bool> editartitular(Checkinmodel checkinmodel) async {
    String usuario = pre.correo;

    final url =
        '$_url/Usuarios/${usuario.toUpperCase()}/Checkin/titular/${checkinmodel.id}.json';

    final resp = await http.put(url, body: checkinmodelToJson(checkinmodel));

    final data = json.decode(resp.body);

    print(data);

    return true;
  }

  Future<bool> editaracom(Checkinmodel checkinmodel) async {
    String usuario = pre.correo;

    final url =
        '$_url/Usuarios/${usuario.toUpperCase()}/Checkin/acompanantes/${checkinmodel.id}.json';

    final resp = await http.put(url, body: checkinmodelToJson(checkinmodel));

    final data = json.decode(resp.body);

    print(data);

    return true;
  }

  Future<bool> borrartitular() async {
   String usuario = pre.correo;

    final url = '$_url/Usuarios/${usuario.toUpperCase()}/Checkin/titular.json';

    final resp = await http.delete(url);

    final data = json.decode(resp.body);

    print(data);

    return true;
  }

  Future<bool> borraracom(id) async {
    String usuario = pre.correo;

    final url =
        '$_url/Usuarios/${usuario.toUpperCase()}/Checkin/acompanantes/$id.json';

    final resp = await http.delete(url);

    final data = json.decode(resp.body);

    print(data);

    return true;
  }

  Future<List<Checkinmodel>> cargarsolicitudtitular() async {
    // ignore: unused_local_variable
    String usuario = pre.correo;
    
    
    
    final url = '$_url/Usuarios/${usuario.toUpperCase()}/Checkin/titular.json';
    
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<Checkinmodel> solicitud = [];

    if (data == null) {
      return [];
    }
    data.forEach((id, soli) {
      // print(soli);
      final solitemp = Checkinmodel.fromJson(soli);
      solitemp.id = id;
      solicitud.add(solitemp);
    });

    return solicitud;
  }

  Future<bool> crearsolicitudacompanantes(Checkinmodel checkinmodel) async {
    String usuario = pre.correo;

    final url = '$_url/Usuarios/${usuario.toUpperCase()}/Checkin/acompanantes.json';

    final resp = await http.post(url, body: checkinmodelToJson(checkinmodel));

    final data = json.decode(resp.body);
    pre.idacom = data["name"];
    print(data["name"]);

    return true;
  }

  Future<List<Checkinmodel>> cargarsolicitudacompanantes() async {
    String usuario = pre.correo;

    final url = '$_url/Usuarios/${usuario.toUpperCase()}/Checkin/acompanantes.json';
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<Checkinmodel> solicitud = [];

    if (data == null) {
      return [];
    }
    data.forEach((id, soli) {
      // print(soli);
      final solitemp = Checkinmodel.fromJson(soli);
      solitemp.id = id;
      solicitud.add(solitemp);
    });

    return solicitud;
  }
}
