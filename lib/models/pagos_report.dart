import 'dart:convert';

class PagosReport {
    PagosReport({
        required this.id,
        required this.count,
    });

    String id;
    int count;

    factory PagosReport.fromJson(String str) => PagosReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PagosReport.fromMap(Map<String, dynamic> json) => PagosReport(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}