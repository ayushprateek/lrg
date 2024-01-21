import 'dart:convert';

List<UomModel> uomModelFromJson(String str) =>
    List<UomModel>.from(json.decode(str).map((x) => UomModel.fromJson(x)));

String uomModelToJson(List<UomModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UomModel {
  int? bigintUomId;
  String? varUomCode;
  String? varUomName;

  UomModel({
    this.bigintUomId,
    this.varUomCode,
    this.varUomName,
  });

  factory UomModel.fromJson(Map<String, dynamic> json) => UomModel(
        bigintUomId: int.tryParse(json["bigintUOMId"].toString()),
        varUomCode: json["varUOMCode"],
        varUomName: json["varUOMName"],
      );

  Map<String, dynamic> toJson() => {
        "bigintUOMId": bigintUomId,
        "varUOMCode": varUomCode,
        "varUOMName": varUomName,
      };
}
