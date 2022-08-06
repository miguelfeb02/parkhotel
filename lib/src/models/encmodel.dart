
import 'dart:convert';

Encmodel encmodelFromJson(String str) => Encmodel.fromJson(json.decode(str));

String encmodelToJson(Encmodel data) => json.encode(data.toJson());

class Encmodel {
    Encmodel({
        this.enc,
        this.id,
        this.estado,
       
    });
    bool enc;
    String id;
    String estado="...";
    factory Encmodel.fromJson(Map<String, dynamic> json) => Encmodel(
        enc: json["enc"],
        id: json["id"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "enc": enc,
        "id": id,
        "estado": estado,
       
    };
}
