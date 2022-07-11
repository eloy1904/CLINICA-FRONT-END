import 'dart:convert';

class Usuario {
  Usuario({
    required this.id,
    required this.usuarioId,
    required this.nombreA,
    required this.fechaNaci,
    required this.correo,
    required this.direccion,
    required this.telefono,
  });

  String id;
  int usuarioId;
  String nombreA;
  int fechaNaci;
  String correo;
  String direccion;
  int telefono;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        usuarioId: json["usuarioId"],
        nombreA: json["nombreA"],
        fechaNaci: json["fechaNaci"],
        correo: json["correo"],
        direccion: json["direccion"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "usuarioId": usuarioId,
        "nombreA": nombreA,
        "fechaNaci": fechaNaci,
        "correo": correo,
        "direccion": direccion,
        "telefono": telefono,
      };
}
