import 'dart:convert';

import 'package:miesp/common/keys.dart';
import 'package:miesp/local_storage/local_storage.dart';

List<WarehouseModel> warehouseModelFromJson(String str) =>
    List<WarehouseModel>.from(
        json.decode(str).map((x) => WarehouseModel.fromJson(x)));

String warehouseModelToJson(List<WarehouseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WarehouseModel {
  String? warehouseCode;
  String? warehouseName;

  WarehouseModel({
    this.warehouseCode,
    this.warehouseName,
  });

  factory WarehouseModel.fromJson(Map<String, dynamic> json) => WarehouseModel(
        warehouseCode: json["warehouseCode"],
        warehouseName: json["warehouseName"],
      );

  Map<String, dynamic> toJson() => {
        "warehouseCode": warehouseCode,
        "warehouseName": warehouseName,
      };

  static setSelectedWarehouse({required WarehouseModel warehouseModel}) {
    LocalStorage.getInstance()
        ?.localStorage
        ?.setString(keySelectedWarehouse, jsonEncode(warehouseModel.toJson()));
  }

  static WarehouseModel? getSelectedWarehouse() {
    String selectedWarehouse =
        LocalStorage.getInstance()?.localStorage?.getString(keySelectedWarehouse) ?? '';
    if(selectedWarehouse!='')
    {
      return WarehouseModel.fromJson(jsonDecode(selectedWarehouse));
    }
    else
    {
      return null;
    }
  }
}
