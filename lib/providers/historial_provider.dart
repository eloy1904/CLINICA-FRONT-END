import 'dart:io';

import 'package:flutter/material.dart';

import '../models/historial.dart';
import 'package:http/http.dart' as http;
import '../models/historial_response.dart';

class HistorialProvider extends ChangeNotifier {
  String _baseUrl = '192.168.100.93:3999';

  List<Historial> listaHistorial = [];
  HistorialProvider() {
    print('ingresando a historialProvider');
    this.getOnHistorialList();
  }

  getOnHistorialList() async {
    var url = Uri.http(_baseUrl, '/api/historial', {});
    final response = await http.get(url);
    print(response.body);
    final historialResponse = HistorialResponse.fromJson(response.body);
    listaHistorial = historialResponse.historial;
    notifyListeners();
  }

  saveHistorial(Historial historial) async {
    var url = Uri.http(_baseUrl, '/api/historial/save');
    print(historial.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: historial.toJson());
    print(response.body);
    getOnHistorialList();
    notifyListeners();
  }
}
