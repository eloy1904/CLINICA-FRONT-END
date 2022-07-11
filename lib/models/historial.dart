import 'dart:convert';

class Historial {
  Historial({
    required this.id,
    required this.historialId,
    required this.nombre,
    required this.contacto,
  });

  String id;
  int historialId;
  String nombre;
  int contacto;

  factory Historial.fromJson(String str) => Historial.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Historial.fromMap(Map<String, dynamic> json) => Historial(
        id: json["_id"],
        historialId: json["historialId"],
        nombre: json["nombre"],
        contacto: json["contacto"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "historialId": historialId,
        "nombre": nombre,
        "contacto": contacto,
      };
}
