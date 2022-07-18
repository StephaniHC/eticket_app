import 'dart:convert'; 

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        required this.dato,
    });

    String dato;

    factory ScanModel.fromJson(Map<String, dynamic> json ) => ScanModel(
        dato: json["dato"],
    );

    Map<String, dynamic> toJson() => {
        "dato": dato,
    };
}
