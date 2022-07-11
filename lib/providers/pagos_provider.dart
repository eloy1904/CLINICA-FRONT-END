
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/models/pagos.dart';
import 'package:flutter_application_clinica/models/pagos_report.dart';
import 'package:flutter_application_clinica/models/pagos_report_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_clinica/models/pagos_response.dart';




class PagosProvider extends ChangeNotifier{
    
    String _baseUrl = '192.168.100.93:3999';

    List<Pago> listaPagos = [];
    List<PagosReport> listaPagosReport = [];

  PagosProvider() {
    print('Ingresando a PagosProvider');
    this.getOnPagosList();
    this.reportePagos();
  }

  getOnPagosList() async {
    var url = Uri.http(_baseUrl, '/api/pagos', {});
    final response = await http.get(url);
    print(response.body);
    final pagosResponse = PagosResponse.fromJson(response.body);
    listaPagos = pagosResponse.pagos;
    notifyListeners();
  }

  savePagos(Pago pagos) async {

    var url = Uri.http(_baseUrl, '/api/pagos/save');
    print(pagos.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: pagos.toJson());
    print(response.body);
    getOnPagosList();
    notifyListeners();
  }

  reportePagos() async{
    var url = Uri.http(_baseUrl, 'api/reportes/pagosReport');
    final response = await http.get(url);
    final pagosReportResponse = PagosReportResponse.fromJson(response.body);
    listaPagosReport = pagosReportResponse.pagosReport;
    notifyListeners();
  }
}

    






