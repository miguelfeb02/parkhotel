/// To parse this JSON data, do
//
//     final solicitudesmodel = solicitudesmodelFromJson(jsonString);

import 'dart:convert';

Solicitudesmodel solicitudesmodelFromJson(String str) => Solicitudesmodel.fromJson(json.decode(str));

String solicitudesmodelToJson(Solicitudesmodel data) => json.encode(data.toJson());

class Solicitudesmodel {
    Solicitudesmodel({
        this.usuario,
        this.hab,
        this.asunto,
        this.descripcion,
        this.url,
    });
    String usuario;
    String hab;
    String asunto;
    String descripcion;
    String url;
    factory Solicitudesmodel.fromJson(Map<String, dynamic> json) => Solicitudesmodel(
        usuario: json["usuario"],
        hab: json["hab"],
        asunto: json["asunto"],
        descripcion: json["descripcion"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "hab": hab,
        "asunto": asunto,
        "descripcion": descripcion,
        "url": url,
    };
}
