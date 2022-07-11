import 'dart:convert';

class Pago {
    Pago({
        required this.id,
        required this.pagoId,
        required this.nomUsuario,
        required this.numTarje,
        required this.fecha,
        required this.clave,
        required this.categoria,
    });

    String id;
    int pagoId;
    String nomUsuario;
    String numTarje;
    String fecha;
    int clave;
    String categoria;

    factory Pago.fromJson(String str) => Pago.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pago.fromMap(Map<String, dynamic> json) => Pago(
        id: json["_id"],
        pagoId: json["pagoId"],
        nomUsuario: json["NomUsuario"],
        numTarje: json["NumTarje"],
        fecha: json["Fecha"],
        clave: json["Clave"],
        categoria: json["Categoria"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "pagoId": pagoId,
        "NomUsuario": nomUsuario,
        "NumTarje": numTarje,
        "Fecha": fecha,
        "Clave": clave,
        "Categoria": categoria,
    };
}
