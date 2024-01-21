import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:miesp/services/status_helper.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

Future<void> multipartRequest(
    {required var requestObj,
    Function? onSuccess,
    Function? onError,
    required List images}) async {
  // Uri uri = Uri.parse(serviceBaseUrl() + requestObj.getUri());
  // String token = await getAccessToken();
  // token += "Bearer $token";
  Uri uri = Uri.parse("");
  String token = "";
  token += "Bearer $token";

  HttpClient httpClient = HttpClient();
  HttpClientRequest request = await httpClient.postUrl(uri);
  request.headers.set('Accept', 'application/json');
  request.headers.set('Content-type', 'application/json');
  request.headers.set('Authorization', token);
  var req = http.MultipartRequest("POST", uri);
  req.headers['Authorization'] = token;
  req.headers['Accept'] = 'application/json';
  req.headers['Content-type'] = 'application/json';
  requestObj.toJson().forEach((key, value) {
    req.fields[key] = value.toString();
  });

  if (images.isNotEmpty) {
    for (var image in images) {
      var length = await image.imageFile.length();
      var stream =
          http.ByteStream(DelegatingStream.typed(image.imageFile.openRead()));
      var multipartFile = http.MultipartFile(image.name, stream, length,
          filename: basename(image.imageFile.path));
      req.files.add(multipartFile);
    }
  }
  var response = await req.send();

  response.stream.transform(utf8.decoder).listen((value) {
    if (isError(response.statusCode)) {
      Map map = json.decode(value);
      map['statusCode'] = response.statusCode;
      if (onError != null) {
        onError(map);
      }
    } else {
      if (onSuccess != null) {
        onSuccess(response);
      }
    }
  });
}
