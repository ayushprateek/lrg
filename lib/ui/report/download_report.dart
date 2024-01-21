import 'dart:developer';
import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:miesp/common/get_formatted_date.dart';
import 'package:miesp/theme/elements_screen.dart';
import 'package:miesp/theme/get_text_field.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:tbib_downloader/tbib_downloader.dart';

import '../../services/service_manager.dart';
import '../components/elements_button.dart';

class MyNotificationService {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.buttonKeyPressed == 'tbib_downloader_open_file') {
      var res = await TBIBDownloaderOpenFile()
          .openFile(path: receivedAction.payload!['path']!);

      log(res.message);
    } else if (receivedAction.buttonKeyPressed ==
        'tbib_downloader_delete_file') {
      await TBIBDownloaderOpenFile()
          .deleteFile(receivedAction.payload!['path']!);
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TBIBDownloader().init();

  runApp(const App());
}

//app
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Background downloader',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ReportPage());
  }
}

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  double progress = 0;
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return screenWithAppBar(
     title: 'Download Report',
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: LinearProgressIndicator(
              value: progress,
            ),
          ),
          getDateTextField(controller: _startDate, labelText: 'Start Date',
            onChanged: (String pickedDate){
              _startDate.text=pickedDate;
            },
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _startDate.clear();
                  });
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ),
          getDateTextField(controller: _endDate, labelText: 'End Date',
            onChanged: (String pickedDate){
              _endDate.text=pickedDate;
            },
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _endDate.clear();
                  });
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                )),),
        ],
      ),
      bottomNavigationBar: _buttonContainer(),
    );
  }
  Widget _buttonContainer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 13,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: loadingButton(
          isLoading: false,
          btnText: 'Download',
          onPress: () {
            // openFile();
            // ServiceManager.launchCSV();
            download();
          },
        ),
      ),
    );
  }
  download()async{

    if (_startDate.text.isEmpty) {
      getErrorSnackBar('Start Date can not be empty');
      return;
    } else if (_endDate.text.isEmpty) {
      getErrorSnackBar('End Date can not be empty');
      return;
    }
    DateTime startDate = getDateFromString(_startDate.text);
    DateTime endDate = getDateFromString(_endDate.text);

    ///REPLACE DOWNLOAD FUNCTION IN DEPENDENCY
    ///TODO: DO NOT DELETE  THIS COMMENT
    //Future<String?> downloadFile<T>({
    //     required String url,
    //     required DateTime startDate,
    //     required DateTime endDate,
    //     required String fileName,
    //     String? directoryName,
    //     required BuildContext context,
    //     bool disabledOpenFileButton = false,
    //     bool disabledDeleteFileButton = false,
    //     bool disabledShareFileButton = false,
    //     bool hideButtons = false,
    //     bool saveFileInDataApp = false,
    //     bool showNotification = true,
    //     Duration refreshNotificationProgress = const Duration(seconds: 1),
    //     bool showDownloadSpeed = true,
    //     bool showNotificationWithoutProgress = false,
    //     bool receiveBytesAsMB = false,
    //     Function({required int receivedBytes, required int totalBytes})?
    //     onReceiveProgress,
    //     //required Dio dio,
    //   }) async {
    //     final deviceInfo = await DeviceInfoPlugin().androidInfo;
    //     if (deviceInfo.version.sdkInt < 30) {
    //       await Permission.storage.request();
    //       if (!await Permission.storage.isGranted) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           const SnackBar(
    //             backgroundColor: Colors.red,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.all(
    //                 Radius.circular(10),
    //               ),
    //             ),
    //             behavior: SnackBarBehavior.floating,
    //             content: Text('Permission denied to access storage'),
    //           ),
    //         );
    //         Future.delayed(const Duration(seconds: 2), () {
    //           openAppSettings();
    //         });
    //         return null;
    //       }
    //     }
    //
    //     late String downloadDirectory;
    //
    //     if (_downloadStarted) {
    //       dev.log('Download already started');
    //       return null;
    //     }
    //     _downloadStarted = true;
    //     if (Platform.isAndroid && !saveFileInDataApp) {
    //       downloadDirectory =
    //       "${await ExternalPath.getExternalStoragePublicDirectory(
    //           ExternalPath.DIRECTORY_DOWNLOADS)}/";
    //     } else {
    //       if (saveFileInDataApp) {
    //         downloadDirectory = "${(await getApplicationSupportDirectory()).path}/";
    //       } else {
    //         downloadDirectory =
    //         "${(await getApplicationDocumentsDirectory()).path}/";
    //       }
    //     }
    //     if (directoryName != null) {
    //       downloadDirectory = "$downloadDirectory$directoryName/";
    //     }
    //
    //     if (File(downloadDirectory).existsSync()) {
    //       File(downloadDirectory).deleteSync(recursive: true);
    //     }
    //
    //     await Directory(downloadDirectory).create(recursive: true);
    //     if (Platform.isIOS && showNotification) {
    //       await AwesomeNotifications().createNotification(
    //         content: NotificationContent(
    //             id: 1,
    //             channelKey: 'download_channel',
    //             title: 'Downloading',
    //             body: 'Downloading $fileName',
    //             wakeUpScreen: true,
    //             locked: true),
    //       );
    //     }
    //
    //     DateTime startTime = DateTime.now();
    //     DateTime notificationDisplayDate = DateTime.now();
    //     DateTime endTime = DateTime.now().add(refreshNotificationProgress);
    //     String? solvePath;
    //     if (File('$downloadDirectory$fileName').existsSync()) {
    //       solvePath = await getAvailableFilePath('$downloadDirectory$fileName');
    //     }
    //     bool showNewNotification = true;
    //     try {
    //       final response = await _dio.post(
    //         url,
    //         data: {
    //           "startDate": startDate.toIso8601String(),
    //           "endDate": endDate.toIso8601String()
    //         },
    //         options: Options(
    //           responseType: ResponseType.bytes,
    //           // Specify the response type as bytes
    //           followRedirects: false,
    //           // Disable redirects for downloading
    //           headers: {
    //             'accept': '*/*',
    //             'Content-Type': 'application/json',
    //           },
    //           // validateStatus: (status) {
    //           //   return status < 500; // Validate only statuses less than 500
    //           // },
    //         ),
    //         onReceiveProgress: (receivedBytes, totalBytes) async {
    //           // if (receiveBytesAsFileSizeUnit) {
    //           // receivedBytes = formatBytes(receivedBytes, 2).size;
    //           // totalBytes = formatBytes(totalBytes, 2).size;
    //           // }
    //           if (showNotificationWithoutProgress || Platform.isIOS) {
    //             if (totalBytes == -1) {
    //               dev.log('totalBytes == -1');
    //
    //               return;
    //             }
    //             if (receiveBytesAsMB) {
    //               return onReceiveProgress?.call(
    //                   receivedBytes: (receivedBytes / _convertBytesToMB).floor(),
    //                   totalBytes: (totalBytes / _convertBytesToMB).floor());
    //             }
    //             return onReceiveProgress?.call(
    //                 receivedBytes: receivedBytes, totalBytes: totalBytes);
    //           }
    //           if (showNotification && totalBytes != -1) {
    //             if (showNewNotification) {
    //               showNewNotification = false;
    //
    //               await _showProgressNotification(showDownloadSpeed, totalBytes,
    //                   receivedBytes, fileName, startTime);
    //             } else {
    //               notificationDisplayDate = DateTime.now();
    //               if (notificationDisplayDate.millisecondsSinceEpoch >
    //                   endTime.millisecondsSinceEpoch) {
    //                 //   await AwesomeNotifications().dismiss(1);
    //                 showNewNotification = true;
    //                 notificationDisplayDate = endTime;
    //                 endTime = DateTime.now().add(refreshNotificationProgress);
    //               }
    //
    //               // _showProgressNotification(showDownloadSpeed, totalBytes,
    //               //     receivedBytes, fileName, startTime);
    //             }
    //           }
    //           if (totalBytes != -1) {
    //             if (receiveBytesAsMB) {
    //               return onReceiveProgress?.call(
    //                   receivedBytes: (receivedBytes / _convertBytesToMB).floor(),
    //                   totalBytes: (totalBytes / _convertBytesToMB).floor());
    //             }
    //             return onReceiveProgress?.call(
    //                 receivedBytes: receivedBytes, totalBytes: totalBytes);
    //           } else {
    //             dev.log('totalBytes == -1');
    //           }
    //         },
    //       );
    //       print(response);
    //       String filePath = solvePath ?? "$downloadDirectory$fileName";
    //
    //       File file = File(filePath);
    //       await file.writeAsBytes(response.data);
    //       String contents = file.readAsStringSync();
    //       print(contents);
    //
    //
    //       // await _dio.download(
    //       //   url,
    //       //   solvePath ?? "$downloadDirectory$fileName",
    //       //   options: Options(
    //       //     responseType: ResponseType.bytes,
    //       //     followRedirects: false,
    //       //   ),
    //       //   onReceiveProgress: (receivedBytes, totalBytes) async {
    //       //     // if (receiveBytesAsFileSizeUnit) {
    //       //     // receivedBytes = formatBytes(receivedBytes, 2).size;
    //       //     // totalBytes = formatBytes(totalBytes, 2).size;
    //       //     // }
    //       //     if (showNotificationWithoutProgress || Platform.isIOS) {
    //       //       if (totalBytes == -1) {
    //       //         dev.log('totalBytes == -1');
    //       //
    //       //         return;
    //       //       }
    //       //       if (receiveBytesAsMB) {
    //       //         return onReceiveProgress?.call(
    //       //             receivedBytes: (receivedBytes / _convertBytesToMB).floor(),
    //       //             totalBytes: (totalBytes / _convertBytesToMB).floor());
    //       //       }
    //       //       return onReceiveProgress?.call(
    //       //           receivedBytes: receivedBytes, totalBytes: totalBytes);
    //       //     }
    //       //     if (showNotification && totalBytes != -1) {
    //       //       if (showNewNotification) {
    //       //         showNewNotification = false;
    //       //
    //       //         await _showProgressNotification(showDownloadSpeed, totalBytes,
    //       //             receivedBytes, fileName, startTime);
    //       //       } else {
    //       //         notificationDisplayDate = DateTime.now();
    //       //         if (notificationDisplayDate.millisecondsSinceEpoch >
    //       //             endTime.millisecondsSinceEpoch) {
    //       //           //   await AwesomeNotifications().dismiss(1);
    //       //           showNewNotification = true;
    //       //           notificationDisplayDate = endTime;
    //       //           endTime = DateTime.now().add(refreshNotificationProgress);
    //       //         }
    //       //
    //       //         // _showProgressNotification(showDownloadSpeed, totalBytes,
    //       //         //     receivedBytes, fileName, startTime);
    //       //       }
    //       //     }
    //       //     if (totalBytes != -1) {
    //       //       if (receiveBytesAsMB) {
    //       //         return onReceiveProgress?.call(
    //       //             receivedBytes: (receivedBytes / _convertBytesToMB).floor(),
    //       //             totalBytes: (totalBytes / _convertBytesToMB).floor());
    //       //       }
    //       //       return onReceiveProgress?.call(
    //       //           receivedBytes: receivedBytes, totalBytes: totalBytes);
    //       //     } else {
    //       //       dev.log('totalBytes == -1');
    //       //     }
    //       //   },
    //       // );
    //
    //       if (showNotification) {
    //         await AwesomeNotifications().dismiss(1);
    //         await AwesomeNotifications().createNotification(
    //           actionButtons: hideButtons
    //               ? null
    //               : [
    //             NotificationActionButton(
    //               enabled: !disabledOpenFileButton,
    //               color: Colors.green.shade900,
    //               key: "tbib_downloader_open_file",
    //               label: "Open File",
    //             ),
    //             NotificationActionButton(
    //               enabled: !disabledDeleteFileButton,
    //               key: "tbib_downloader_delete_file",
    //               isDangerousOption: true,
    //               color: Colors.red.shade900,
    //               label: "Delete File",
    //             ),
    //             NotificationActionButton(
    //               enabled: !disabledShareFileButton,
    //               key: "tbib_downloader_share_file",
    //               color: Colors.green.shade900,
    //               label: "Share File",
    //             ),
    //           ],
    //           content: NotificationContent(
    //             id: 1,
    //             channelKey: 'download_completed_channel',
    //             title: 'Download completed',
    //             body: 'Download completed $fileName',
    //             wakeUpScreen: true,
    //             color: Colors.green,
    //             payload: {
    //               'path': solvePath ?? "$downloadDirectory$fileName",
    //               'mime': lookupMimeType(downloadDirectory + fileName)
    //             },
    //           ),
    //         );
    //       }
    //     } catch (e) {
    //       dev.log('download error: $e');
    //     }
    //     _downloadStarted = false;
    //
    //
    //     return solvePath ?? "$downloadDirectory$fileName";
    //   }
    //-------------------------
    var path = await TBIBDownloader().downloadFile(
      context: context,
      url:
      '${ServiceManager.baseURL}Items/DownloadReport',
      receiveBytesAsMB: true,
      fileName: 'report.csv',
      // directoryName: 'data',
      onReceiveProgress: ({int? receivedBytes, int? totalBytes}) {
        if (!context.mounted) {
          return;
        }
        setState(() {
          progress = (receivedBytes! / totalBytes!);
        });
      }, startDate: startDate,
      endDate: endDate,
      // saveFileInDataApp: true,
      // directoryName: 'test',
      // onReceiveProgress: ({int? count, int? total}) => debugPrint(
      //     'count: $count, total: $total, progress: ${count! / total!}'),
    );
    if(await File('/storage/emulated/0/Download/report.csv').exists())
      {
        getSuccessSnackBar('Report Downloaded Successfully');
      }
    else
      {
        getErrorSnackBar('Failed to Downloaded Report');
      }
  }


  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: MyNotificationService.onActionReceivedMethod,
        onNotificationCreatedMethod:
            MyNotificationService.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            MyNotificationService.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            MyNotificationService.onDismissActionReceivedMethod);
  }
}
