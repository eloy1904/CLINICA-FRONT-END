

import 'package:flutter/material.dart';
import 'package:flutter_application_clinica/models/pagos_report.dart';
import 'package:flutter_application_clinica/providers/pagos_provider.dart';
import 'package:flutter_application_clinica/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class reportScreen extends StatefulWidget {
  reportScreen({Key? key}) : super(key: key);

  @override
  State<reportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<reportScreen> {
  @override
  Widget build(BuildContext context) {

    final pagosProvider = Provider.of<PagosProvider>(context);
    final List<PagosReport> listaPagosReport = pagosProvider.listaPagosReport;
    
    List<charts.Series<PagosReport, String>> serie =[
      charts.Series(
        id:'ReportePagos',
        data: listaPagosReport,
        domainFn: (PagosReport serie,_)=> serie.id,
        measureFn: (PagosReport serie,_)=> serie.count,
        colorFn: (PagosReport serie,_)=> charts.ColorUtil.fromDartColor(Colors.greenAccent)
      )
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Reportes')),
      drawer: MenuLateral(),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('REPORTE DE PAGOS POR CATEGORIA'),
                  Expanded(
                    child: charts.BarChart(serie, animate: true,)
                  ),
                  Text('FUENTE: MONGODB')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}        