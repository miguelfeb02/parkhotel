



import 'package:parkhotel/src/models/pmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parkhotel/src/preferenciasusuario/preferencias.dart';

class PqrProvider {
  final PreferenciasUsuario pre = new PreferenciasUsuario();
  final String _url = 'https://parkhotelapp123.firebaseio.com';

  Future<bool> crearpqr(Pqrmodel pqrmodel) async {
    String usuario = pre.correo;
    
    final url ='$_url/pqr/${usuario.toUpperCase()}/pqr.json';

    final resp =
        await http.post(url, body: pqrmodelToJson(pqrmodel));

    final data = json.decode(resp.body);

    print(data);

    return true;
  }

  Future<List<Pqrmodel>> cargarpqr() async {
    String usuario = pre.correo;
    
    final url = '$_url/pqr/${usuario.toUpperCase()}/pqr.json';
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<Pqrmodel> solicitud = [];

    if (data == null) {
      return [];
    }
    data.forEach((id, soli) {
      // print(soli);
      final solitemp = Pqrmodel.fromJson(soli);

      solicitud.add(solitemp);
    });

    return solicitud;
  }

  Future<List> cargarpqrtotal() async {
    final url = '$_url/pqr.json';
    final resp = await http.get(url);
    final data = json.decode(resp.body);
    final list = [];

    for (var k in data.keys) {
      list.add(k);
    }
    return list;
  }

  Future<List<Pqrmodel>> cargarpqrparcial(usuariox) async {
    
    final url = '$_url/pqr/$usuariox.json';
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<Pqrmodel> solicitud = [];

    if (data == null) {
      return [];
    }
    data.forEach((id, soli) {
      // print(soli);
      final solitemp =Pqrmodel.fromJson(soli);

      solicitud.add(solitemp);
    });

    return solicitud;
  }

   
}
