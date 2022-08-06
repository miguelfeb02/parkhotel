

import 'dart:convert';

Pqrmodel pqrmodelFromJson(String str) => Pqrmodel.fromJson(json.decode(str));

String pqrmodelToJson(Pqrmodel data) => json.encode(data.toJson());

class Pqrmodel {
    Pqrmodel({
        this.usuario,
        this.urlfoto,
        this.asunto,
        this.descripcion,
    });
    String usuario;
    String urlfoto;
    String asunto;
    String descripcion;

    factory Pqrmodel.fromJson(Map<String, dynamic> json) => Pqrmodel(
        usuario: json["usuario"],
        urlfoto: json["urlfoto"],
        asunto: json["asunto"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "urlfoto": urlfoto,
        "asunto": asunto,
        "descripcion": descripcion,
    };
}
