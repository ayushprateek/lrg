import 'dart:convert';
import 'dart:io';

import 'package:miesp/services/status_helper.dart';

postRequest(
    {required var requestObj,
    required var successObject,
    Function? onError,
    Function? onSuccess}) async {
  // Uri uri = Uri.parse(serviceBaseUrl() + requestObj.getUri());
  // String token = await getAccessToken();
  Uri uri = Uri.parse("");
  String token = "";
  token += "Bearer $token";
  HttpClient httpClient = HttpClient();
  HttpClientRequest request = await httpClient.postUrl(uri);
  request.headers.set('Accept', 'application/json');
  request.headers.set('Content-type', 'application/json');
  request.headers.set('Authorization', token);
  request.add(utf8.encode(json.encode(requestObj.toJson())));
  HttpClientResponse response = await request.close();
  String reply = await utf8.decoder.bind(response).join();
  httpClient.close();
  if (isError(response.statusCode)) {
    Map map = json.decode(reply);
    map['statusCode'] = response.statusCode;
    onError != null ? onError(map) : "";
  } else {
    successObject.fromJson(json.decode(reply));
    onSuccess != null ? onSuccess(successObject) : "";
  }
}
