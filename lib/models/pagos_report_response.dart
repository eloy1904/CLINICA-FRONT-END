import 'dart:convert';

import 'package:flutter_application_clinica/models/pagos_report.dart';

class PagosReportResponse {
    PagosReportResponse({
        required this.pagosReport,
    });

    List<PagosReport> pagosReport;

    factory PagosReportResponse.fromJson(String str) => PagosReportResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PagosReportResponse.fromMap(Map<String, dynamic> json) => PagosReportResponse(
        pagosReport: List<PagosReport>.from(json["pagosReport"].map((x) => PagosReport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "pagosReport": List<dynamic>.from(pagosReport.map((x) => x.toMap())),
    };
}