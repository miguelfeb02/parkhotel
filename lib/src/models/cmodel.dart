import 'dart:convert';

Checkinmodel checkinmodelFromJson(String str) =>
    Checkinmodel.fromJson(json.decode(str));

String checkinmodelToJson(Checkinmodel data) => json.encode(data.toJson());

class Checkinmodel {
  Checkinmodel({
    this.nombre,
    this.nacio,
    this.ident,
    this.nident,
    this.correo,
    this.direc,
    this.ciudad,
    this.celular,
    this.oficio,
    this.id,
    this.fechae,
    this.fechas,
    this.fotourl1,
    this.fotourl2,
    this.hab,
    this.enc,
  });
  String nombre;
  String nacio;
  String ident;
  String nident;
  String correo;
  String direc;
  String ciudad;
  String celular;
  String oficio;
  String id;
  String fechae;
  String fechas;
  String fotourl1;
  String fotourl2;
  String hab;
  bool enc;

  factory Checkinmodel.fromJson(Map<String, dynamic> json) => Checkinmodel(
        nombre: json["nombre"],
        nacio: json["nacio"],
        ident: json["ident"],
        nident: json["nident"],
        correo: json["correo"],
        direc: json["direc"],
        ciudad: json["ciudad"],
        celular: json["celular"],
        oficio: json["oficio"],
        id: json["id"],
        fechae: json["fechae"],
        fechas: json["fechas"],
        fotourl1: json["fotourl1"],
        fotourl2: json["fotourl2"],
        hab: json["hab"],
        enc: json["enc"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "nacio": nacio,
        "ident": ident,
        "nident": nident,
        "correo": correo,
        "direc": direc,
        "ciudad": ciudad,
        "celular": celular,
        "oficio": oficio,
        "id": id,
        "fechae": fechae,
        "fechas": fechas,
        "fotourl1": fotourl1,
        "fotourl2": fotourl2,
        "hab": hab,
        "enc": enc,
      };
}
