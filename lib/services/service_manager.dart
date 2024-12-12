import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:miesp/models/customer_model.dart';
import 'package:miesp/models/item_details_model.dart';
import 'package:miesp/models/stock_count_request_model.dart';
import 'package:miesp/models/stock_counting_detail_model.dart';
import 'package:miesp/models/uom_model.dart';
import 'package:miesp/models/warehouse_model.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// import 'package:url_launcher/url_launcher.dart';

class ServiceManager {
  // static String baseURL = 'http://51.79.229.83:8080/API/';///DEVELOPMENT
  static String baseURL = 'http://51.79.229.83:8080/Live/API/';///LIVE
  static Map<String, String>? header = {
    'accept': '*/*',
    'Content-Type': 'application/json'
  };

  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      getErrorSnackBar('No Internet');
      return false;
    }
    return true;
  }

  static launchInBrowser(Uri? uri) async {
    try {
      if (await canLaunchUrl(uri ?? Uri.parse(''))) {
        await launchUrl(uri ?? Uri.parse(''));
      } else {

      }
    } catch (e) {

    }
  }
  static launchCSV() async {
    try {
      File file=File('/storage/emulated/0/Download/report.csv');
      print(await file.exists());
      if (await canLaunchUrl(Uri.parse('/storage/emulated/0/Download/report.csv'))) {
        await launchUrl(Uri.parse('/storage/emulated/0/Download/report.csv'));
      } else {
        print('Cant launch');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> login({
    required String UserEmail,
    required String Password,
    required Function(CustomerModel) onSuccess,
    required Function onError,
  }) async {
    CustomerModel? customerModel;
    var res = await http.post(Uri.parse('${baseURL}Account/Login'),
        headers: header,
        body: jsonEncode({"UserEmail": UserEmail, "Password": Password}));
    print(res.body);
    if (res.statusCode == 200) {
      customerModel = CustomerModel.fromJson(jsonDecode(res.body));
      onSuccess(customerModel);
    } else {
      onError();
    }
  }

  static Future<void> getWarehouseList({
    required Function(List<WarehouseModel>) onSuccess,
    required Function onError,
  }) async {
    List<WarehouseModel>? warehouseList = [];
    ;
    var res = await http.get(
      Uri.parse('${baseURL}Items/GetWarehouseList'),
      headers: header,
    );
    print(res.body);
    if (res.statusCode == 200) {
      warehouseList = warehouseModelFromJson(res.body);
      onSuccess(warehouseList);
    } else {
      onError();
    }
  }

  static Future<void> getUOMList({
    required Function(List<UomModel>) onSuccess,
    required Function onError,
  }) async {
    List<UomModel>? uomList = [];
    var res = await http.get(
      Uri.parse('${baseURL}Items/GetUOM'),
      headers: header,
    );
    print(res.body);
    if (res.statusCode == 200) {
      uomList = uomModelFromJson(res.body);
      onSuccess(uomList);
    } else {
      onError();
    }
  }

  static Future<void> saveStockCounting({
    required List<StockCountRequestModel> requestList,
    required Function onSuccess,
    required Function(String error) onError,
  }) async {
    var res = await http.post(
      Uri.parse('${baseURL}Items/SaveStockCounting'),
      headers: header,
      body: jsonEncode(requestList),
    );
    print(res.body);
    if (res.statusCode == 200) {
      onSuccess(jsonDecode(res.body));
    } else {
      onError(res.body);
    }
  }

  static Future<void> getItemDetails({
    required String barCode,
    required Function(ItemDetailModel) onSuccess,
    required Function onError,
  }) async {
    ItemDetailModel? warehouseList;
    CustomerModel customerModel = CustomerModel.getLoginCustomer();
    WarehouseModel? warehouseModel = WarehouseModel.getSelectedWarehouse();

    var res = await http.post(
      Uri.parse('${baseURL}Items/GetItemDetail'),
      body: jsonEncode({
        "Barcode": barCode,
        "UserId": customerModel.userId ?? 0,
        "WarehouseCode": warehouseModel?.warehouseCode ?? ''
      }),
      headers: header,
    );
    print(res.body);
    if (res.statusCode == 200) {
      if(res.body=='null')
      {
        onError();
        return;
      }
      warehouseList = itemDetailModelFromJson(res.body);
      onSuccess(warehouseList);
    } else {
      onError();
    }
  }

  static Future<void> getStockCountingDetail({
    required String barCode,
    required Function(StockCountingDetailModel) onSuccess,
    required Function onError,
  }) async {
    StockCountingDetailModel? stockCountingDetail;
    CustomerModel customerModel = CustomerModel.getLoginCustomer();
    WarehouseModel? warehouseModel = WarehouseModel.getSelectedWarehouse();

    var res = await http.post(
      Uri.parse('${baseURL}Items/GetStockCountingDetail'),
      body: jsonEncode({
        "Barcode": barCode,
        "UserId": customerModel.userId ?? 0,
        "WarehouseCode": warehouseModel?.warehouseCode ?? ''
      }),
      headers: header,
    );
    print(res.body);
    if (res.statusCode == 200) {
      if(res.body=='null')
        {
          onError();
          return;
        }
      stockCountingDetail = stockCountingDetailModelFromJson(res.body);
      onSuccess(stockCountingDetail);
    } else {
      onError();
    }
  }

// static sendEmail(
//   var recipient,
//   var subject,
//   var h1,
//   var h2,
//   var body, {
//   Function? onSuccess,
//   Function(String error)? onError,
// }) async {
//   String imagePath = 'http://139.59.54.184:8000/images/GoKartLogo.png';
//   body +=
//       "<br><I>If you have any query then kindly reply to this email or contact us at contact@kishul.com</I>";
//   String username = 'ayush.kishul@gmail.com';
//   String password = 'rfizqgzxzavkwhtm';
//   //also use for gmail smtp
//   final smtpServer = gmail(username, password);
//   // final domainSmtp = value['email_domain_smtp'];
//   // final smtpServer = SmtpServer(domainSmtp,
//   //     username: username, password: password, port: value['email_port']);
//   final message = Message()
//     ..from = Address(username, 'GoKart')
//     ..recipients.add(recipient)
//     ..subject = subject
//     ..text = 'This is the plain text.\nThis is line 2 of the text part.'
//     ..html =
//         "<img src=$imagePath width=180><h1>$h1</h1>\n\n<h2>$h2</h2>\n\n<p>$body </p>";
//
//   try {
//     print(smtpServer.toString());
//     final sendReport = await send(message, smtpServer);
//     print('Message sent: $sendReport');
//     if (onSuccess != null) {
//       onSuccess();
//     }
//   } catch (e) {
//     print('Message not sent.');
//     print(e.toString());
//     if (onError != null) {
//       onError(e.toString());
//     }
//     CustomSnackBar.errorSnackBar(e.toString());
//   }
// }
// static void updateCurrentLangCode(String locale) async {
//   LocalStorage.getInstance()
//       ?.localStorage
//       ?.setString(keyAppLocaleCode, locale);
//   Get.updateLocale(CustomLocale.toLocale(locale));
// }
}
