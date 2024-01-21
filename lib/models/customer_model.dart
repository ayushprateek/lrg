import 'dart:convert';

import 'package:miesp/common/keys.dart';
import 'package:miesp/local_storage/local_storage.dart';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  int? userId;
  String? userCode;
  String? email;
  int? roleId;
  String? token;

  CustomerModel({
    this.userId,
    this.userCode,
    this.email,
    this.roleId,
    this.token,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        userId: int.tryParse(json["userId"].toString()),
        userCode: json["userCode"],
        email: json["email"] ?? '',
        roleId: int.tryParse(json["roleId"].toString()),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userCode": userCode,
        "email": email,
        "roleId": roleId,
        "token": token,
      };

  static setLoginCustomer({required CustomerModel customerModel}) {
    LocalStorage.getInstance()
        ?.localStorage
        ?.setString(keyObjUser, jsonEncode(customerModel.toJson()));
    LocalStorage.getInstance()
        ?.localStorage
        ?.setString(keyLoginTime, DateTime.now().toIso8601String());
  }

  static CustomerModel getLoginCustomer() {
    String customer =
        LocalStorage.getInstance()?.localStorage?.getString(keyObjUser) ?? '';
    return CustomerModel.fromJson(jsonDecode(customer));
  }
}
