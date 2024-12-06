import 'dart:convert';

StockCountRequestModel stockCountRequestModelFromJson(String str) =>
    StockCountRequestModel.fromJson(json.decode(str));

String stockCountRequestModelToJson(StockCountRequestModel data) =>
    json.encode(data.toJson());

class StockCountRequestModel {
  String? varItemNo;
  String? varUomCode;
  double? decInStock;
  String? varWarehouseCode;
  double? decQuantity;
  int? bigintUserId;
  String? varRackNo;
  String? varDeviceNo;
  String? varBarcode;
  String? varItemDescription;

  StockCountRequestModel({
    this.varItemNo,
    this.varUomCode,
    this.decInStock,
    this.varWarehouseCode,
    this.decQuantity,
    this.bigintUserId,
    this.varRackNo,
    this.varDeviceNo,
    this.varBarcode,
    this.varItemDescription,
  });

  factory StockCountRequestModel.fromJson(Map<String, dynamic> json) =>
      StockCountRequestModel(
        varItemNo: json["varItemNo"],
        varUomCode: json["varUOMCode"],
        decInStock: double.tryParse(json["decInStock"].toString()),
        varWarehouseCode: json["varWarehouseCode"],
        decQuantity: double.tryParse(json["decQuantity"].toString()),
        bigintUserId: json["bigintUserId"],
        varRackNo: json["varRackNo"],
        varDeviceNo: json["varDeviceNo"],
        varBarcode: json["varBarcode"],
        varItemDescription: json["varItemDescription"],
      );

  Map<String, dynamic> toJson() => {
        "varItemNo": varItemNo,
        "varUOMCode": varUomCode,
        "decInStock": decInStock,
        "varWarehouseCode": varWarehouseCode,
        "decQuantity": decQuantity,
        "bigintUserId": bigintUserId,
        "varRackNo": varRackNo,
        "varDeviceNo": varDeviceNo,
        "varBarcode": varBarcode,
        "varItemDescription": varItemDescription,
      };
}
