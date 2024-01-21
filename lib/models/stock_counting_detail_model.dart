import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:miesp/models/uom_model.dart';

StockCountingDetailModel stockCountingDetailModelFromJson(String str) =>
    StockCountingDetailModel.fromJson(json.decode(str));

String stockCountingDetailModelToJson(StockCountingDetailModel data) =>
    json.encode(data.toJson());

class StockCountingDetailModel {
  int? bigintItemId;
  String? varItemNo;
  String? varBarcode;
  String? varUomCode;
  String? varUomName;
  double? decInStock;
  String? varWarehouseCode;
  double? decQuantity;
  TextEditingController quantity=TextEditingController();
  int? bigintUserId;
  DateTime? dtModifiedOn;
  String? varRackNo;
  String? varItemDescription;
  List<UomModel>? uomList;
  Set<String> uomNameList = {'---SELECT---'};
  StockCountingDetailModel({
    this.bigintItemId,
    this.varItemNo,
    this.varBarcode,
    this.varUomCode,
    this.varUomName,
    this.decInStock,
    this.varWarehouseCode,
    this.decQuantity,
    this.bigintUserId,
    this.dtModifiedOn,
    this.varRackNo,
    this.varItemDescription,
    this.uomList,
  });

  factory StockCountingDetailModel.fromJson(Map<String, dynamic> json){

    return StockCountingDetailModel(
      bigintItemId: int.tryParse(json["bigintItemId"].toString()),
      varItemNo: json["varItemNo"],
      varBarcode: json["varBarcode"],
      varUomCode: json["varUOMCode"],
      varUomName: json["varUOMName"],
      decInStock: double.tryParse(json["decInStock"].toString()),
      varWarehouseCode: json["varWarehouseCode"],
      decQuantity: double.tryParse(json["decQuantity"].toString()),
      bigintUserId: int.tryParse(json["bigintUserId"].toString()),
      dtModifiedOn: DateTime.tryParse(json["dtModifiedOn"].toString()),
      varRackNo: json["varRackNo"],
      varItemDescription: json["varItemDescription"],
      uomList:
      json["uomList"] is List ? getUomList(json["uomList"]) : null,
    );
  }
  static List<UomModel> getUomList(List dynamicUomList) {
    List<UomModel> uomList = [];
    for (var price in dynamicUomList) {
      uomList.add(UomModel.fromJson(price));
    }
    return uomList;
  }

  Map<String, dynamic> toJson() => {
        "bigintItemId": bigintItemId,
        "varItemNo": varItemNo,
        "varBarcode": varBarcode,
        "varUOMCode": varUomCode,
        "varUOMName": varUomName,
        "decInStock": decInStock,
        "varWarehouseCode": varWarehouseCode,
        "decQuantity": decQuantity,
        "bigintUserId": bigintUserId,
        "dtModifiedOn": dtModifiedOn?.toIso8601String(),
        "varRackNo": varRackNo,
        "varItemDescription": varItemDescription,
      };
}
