import 'dart:convert';

import 'package:flutter_application_clinica/models/historial.dart';

class HistorialResponse {
  HistorialResponse({
    required this.historial,
  });

  List<Historial> historial;

  factory HistorialResponse.fromJson(String str) =>
      HistorialResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistorialResponse.fromMap(Map<String, dynamic> json) =>
      HistorialResponse(
        historial: List<Historial>.from(
            json["historial"].map((x) => Historial.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "historial": List<dynamic>.from(historial.map((x) => x.toMap())),
      };
}
