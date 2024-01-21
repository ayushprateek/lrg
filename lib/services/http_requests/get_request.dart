import 'dart:convert';

import 'package:miesp/services/status_helper.dart';
import 'package:miesp/theme/custom_snack_bar.dart';
import 'package:http/http.dart' as http;

getRequest(Uri uri,
    {Map<String, String>? header,
    Function? onError,
    Function? onSuccess,
    var successObject}) async {
  var res = await http.get(uri, headers: header);
  if (isError(res.statusCode)) {
    CustomSnackBar.errorSnackBar(json.decode(res.body)['message']);
    Map map = json.decode(res.body);
    map['statusCode'] = res.statusCode;
    onError != null ? onError(map) : "";
  } else {
    successObject.fromJson(json.decode(res.body));
    onSuccess != null ? onSuccess(successObject) : "";
  }
}
