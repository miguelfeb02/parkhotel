import 'dart:convert';



Checkoutmodel checkoutmodelFromJson(String str) =>
    Checkoutmodel.fromJson(json.decode(str));

String checkoutmodelToJson(Checkoutmodel data) => json.encode(data.toJson());

class Checkoutmodel {
  Checkoutmodel({
    this.p1,
    this.p2,
    this.p3,
    this.p4,
    this.p5,
    this.p6,
    this.p7,
    this.p8,
    this.p9,
    this.p10,
    this.p11,
    this.p12,
    this.p13,
    this.p14,
    this.p15,
    this.nombre,
     this.correo,
     this.celular,
     this.cedula,
     this.fechaent,
  });
  String p1;
  String p2;
  String p3;
  String p4;
  String p5;
  String p6;
  String p7;
  String p8;
  String p9;
  String p10;
  String p11;
  String p12;
  String p13;
  String p14;
  String p15;
  String nombre;
  String correo;
  String cedula;
  String celular;
  String fechaent;

  factory Checkoutmodel.fromJson(Map<String, dynamic> json) => Checkoutmodel(
        p1: json["p1"],
        p2: json["p2"],
        p3: json["p3"],
        p4: json["p4"],
        p5: json["p5"],
        p6: json["p6"],
        p7: json["p7"],
        p8: json["p8"],
        p9: json["p9"],
        p10: json["p10"],
        p11: json["p11"],
        p12: json["p12"],
        p13: json["p13"],
        p14: json["p14"],
        p15: json["p15"],
        nombre: json["nombre"],
        correo: json["correo"],
        celular: json["celular"],
        cedula: json["cedula"],
        fechaent: json["fechaent"],
      );

  Map<String, dynamic> toJson() => {
        "p1": p1,
        "p2": p2,
        "p3": p3,
        "p4": p4,
        "p5": p5,
        "p6": p6,
        "p7": p7,
        "p8": p8,
        "p9": p9,
        "p10": p10,
        "p11": p11,
        "p12": p12,
        "p13": p13,
        "p14": p14,
        "p15": p15,
        "nombre": nombre,
        "cedula": cedula,
        "correo": correo,
        "fechaent": fechaent,
        "celular": celular,
      };
}
