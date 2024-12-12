import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miesp/common/app_functions.dart';
import 'package:miesp/models/customer_model.dart';
import 'package:miesp/models/stock_count_request_model.dart';
import 'package:miesp/models/stock_counting_detail_model.dart';
import 'package:miesp/models/uom_model.dart';
import 'package:miesp/services/service_manager.dart';
import 'package:miesp/theme/custom_snack_bar.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/theme/elements_screen.dart';
import 'package:miesp/theme/get_text_field.dart';
import 'package:miesp/ui/components/back_pressed_warning.dart';
import 'package:miesp/ui/components/elements_button.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:miesp/ui/components/scan.dart';
import 'package:miesp/ui/components/space_dividers.dart';
import 'package:miesp/ui/dashboard.dart';

class StockCounting extends StatefulWidget {
  const StockCounting({super.key});

  @override
  State<StockCounting> createState() => _StockCountingState();
}

class _StockCountingState extends State<StockCounting> {
  final TextEditingController _deviceNumber = TextEditingController();
  final TextEditingController _rackNo = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<StockCountingDetailModel> items = [];
  String selectedOption = 'Scan';
  Set<String> optionList = {'Scan', 'Manual'};

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  _onBackButtonPressed() {
    if (_rackNo.text.isNotEmpty || items.isNotEmpty) {
      showBackPressedWarning(
          onBackPressed: null,
          text: 'Your data is not saved. Are you sure you want to go back?');
    } else {
      Get.offAll(() => Dashboard());
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool bb) async {
        await _onBackButtonPressed();
      },
      canPop: false,
      child: screenWithAppBar(
        title: 'Stock Counting',
        onBackPressed: () async {
          await _onBackButtonPressed();
        },
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, bottom: 8, top: 30),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      getTextField(
                          controller: _deviceNumber,
                          labelText: 'Device Number'),
                      getTextField(
                          controller: _rackNo, labelText: 'Rack Number'),
                      if (selectedOption == 'Manual')
                        getTextField(controller: _code, labelText: 'Item Code'),
                      _dropdownButton(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: Get.width / 3,
                            height: Get.height / 18,
                            child: loadingButton(
                                isLoading: false,
                                btnText: '+ Add Item',
                                fontSize: 16,
                                elevation: 4,
                                onPress: () async {
                                  if (selectedOption == 'Scan') {
                                    scanQRCode(
                                        onSuccess: (String barCode) async {
                                      if (!mounted) return;
                                      if (await ServiceManager
                                          .isInternetAvailable()) {
                                        ServiceManager.getStockCountingDetail(
                                            barCode: barCode,
                                            onSuccess: onSuccess,
                                            onError: onError);
                                      }
                                    });
                                  } else {
                                    if (_code.text.isEmpty) {
                                      CustomSnackBar.errorSnackBar(
                                          'Please enter item code');
                                    } else {
                                      ServiceManager.getStockCountingDetail(
                                          barCode: _code.text,
                                          onSuccess: onSuccess,
                                          onError: onError);
                                    }
                                  }
                                }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                        itemCount: items.length,
                        shrinkWrap: true,
                        reverse: true,
                        controller: _scrollController,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          StockCountingDetailModel stockCountingDetail =
                              items[index];
                          return Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4.0,
                                  offset: const Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        getPoppinsTextSpanHeading(
                                                            text: 'Item Code'),
                                                        getPoppinsTextSpanDetails(
                                                            text: stockCountingDetail
                                                                    .varItemNo ??
                                                                ''),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      getPoppinsTextSpanHeading(
                                                          text:
                                                              'Item Description'),
                                                      getPoppinsTextSpanDetails(
                                                          text: stockCountingDetail
                                                                  .varItemDescription ??
                                                              ''),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 8.0,
                                                  top: 4.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      getPoppinsTextSpanHeading(
                                                          text: 'In Stock'),
                                                      getPoppinsTextSpanDetails(
                                                          text: stockCountingDetail
                                                                  .decInStock
                                                                  ?.toStringAsFixed(
                                                                      2) ??
                                                              ''),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        flex: 8,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       left: 8.0,
                                            //       right: 8.0,
                                            //       top: 4.0),
                                            //   child: Align(
                                            //     alignment: Alignment.topLeft,
                                            //     child: Text.rich(
                                            //       TextSpan(
                                            //         children: [
                                            //           getPoppinsTextSpanHeading(
                                            //               text: 'UOM Code'),
                                            //           getPoppinsTextSpanDetails(
                                            //               text: stockCountingDetail
                                            //                       .varUomCode ??
                                            //                   ''),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  22,
                                              margin: const EdgeInsets.only(
                                                  top: 10, right: 10),
                                              child: getTextFieldWithoutLookup(
                                                controller: stockCountingDetail
                                                    .quantity,
                                                labelText: 'Quantity',
                                                keyboardType:
                                                    getDecimalKeyboardType(),
                                                inputFormatters: [
                                                  getDecimalRegEx()
                                                ],
                                                style: new TextStyle(
                                                  fontFamily: "Poppins",
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 20),
                                              child: FittedBox(
                                                child: Row(
                                                  children: [
                                                    getHeadingText(
                                                        text: 'UOM: '),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: DropdownButton<
                                                          String>(
                                                        value:
                                                            '${stockCountingDetail.varUomName}',
                                                        onChanged:
                                                            (String? newValue) {
                                                          stockCountingDetail
                                                                  .varUomName =
                                                              newValue;
                                                          stockCountingDetail
                                                                  .varUomCode =
                                                              getUOMCode(
                                                                  UOMName:
                                                                      newValue!,
                                                                  stockCountingDetailModel:
                                                                      stockCountingDetail);

                                                          setState(() {});
                                                        },
                                                        items: stockCountingDetail
                                                            .uomNameList
                                                            .map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: FittedBox(
                                                                child: Text(
                                                                    value)),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                height: Get.height / 24,
                                                // color: Colors.red,
                                                width: Get.width / 4,
                                                margin: const EdgeInsets.only(
                                                    right: 10, left: 8),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: () {
                                                    showBackPressedWarning(
                                                      onBackPressed: () {
                                                        items.removeAt(index);
                                                        setState(() {});
                                                        Get.back();
                                                      },
                                                      text:
                                                          'Are you sure you want to delete ${stockCountingDetail.varItemNo}?',
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.delete_forever,
                                                        color: Colors.red,
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      getHeadingText(
                                                          text: 'Delete'),
                                                    ],
                                                  ),
                                                ),
                                                //
                                                // child: ListTile(
                                                //   contentPadding:  EdgeInsets.zero,
                                                //   tileColor: Colors.blue,
                                                //   leading: Icon(Icons.delete_forever,color: Colors.red,),
                                                //   title: getHeadingText(text: 'Delete'),
                                                // ),
                                                // child: loadingButton(
                                                //     isLoading: false,
                                                //     backColor: Colors.red,
                                                //     btnText: 'Delete',
                                                //     onPress: () {}),
                                              ),
                                            ),
                                          ],
                                        ),
                                        flex: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return getDivider();
                        },
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _save,
          child: FittedBox(
              child: getHeadingText(
                  text: 'Submit', color: Colors.white, fontSize: 10)),
        ),
      ),
    );
  }

  Widget _dropdownButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 15, right: 20),
      child: Row(
        children: [
          Expanded(child: getHeadingText(text: 'Select option')),
          Expanded(
            child: SizedBox(
              width: Get.width / 1.2,
              child: DropdownButton<String>(
                value: selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                items: optionList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: FittedBox(child: Text(value)),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getUOMCode(
      {required String UOMName,
      required StockCountingDetailModel stockCountingDetailModel}) {
    String code = '';
    for (UomModel uom in stockCountingDetailModel.uomList ?? []) {
      if (UOMName == uom.varUomName) {
        code = uom.varUomCode!;
        break;
      }
    }
    return code;
  }

  getInfo() async {
    _deviceNumber.text = (await getDeviceId()) ?? '';
    setState(() {});
  }

  onSuccess(StockCountingDetailModel countingDetailModel) {
    print(countingDetailModel.toJson());
    _code.clear();
    countingDetailModel.quantity.text =
        countingDetailModel.decQuantity?.toStringAsFixed(2) ?? '';
    if (countingDetailModel.quantity.text == '0.00') {
      countingDetailModel.quantity.clear();
    }
    if (countingDetailModel.varUomName == null ||
        countingDetailModel.varUomName == '' ||
        countingDetailModel.varUomName == 'null') {
      countingDetailModel.varUomName = '---SELECT---';
    }

    for (UomModel uom in countingDetailModel.uomList ?? []) {
      if (uom.varUomName != null && uom.varUomName != '') {
        countingDetailModel.uomNameList.add(uom.varUomName!);
      }
    }
    setState(() {
      items.add(countingDetailModel);
    });
  }

  onError() {
    getErrorSnackBar('Item does not exists');
  }

  bool isFormValidated() {
    bool isSuccess = true;
    if (_rackNo.text == '') {
      getErrorSnackBar('Rack no required');
      isSuccess = false;
    } else if (items.isEmpty) {
      getErrorSnackBar('At least one item required');
      isSuccess = false;
    }
    for (StockCountingDetailModel stockCountingDetailModel in items) {
      double? qty = double.tryParse(stockCountingDetailModel.quantity.text);
      if ((qty ?? 0.0) < 0.0) {
        qty = 0.0;
      }

      if ((qty ?? 0.0) == 0.0) {
        getErrorSnackBar(
            "${stockCountingDetailModel.varItemDescription}'s quantity required");
        isSuccess = false;
      }
      if (stockCountingDetailModel.varUomName == '---SELECT---') {
        getErrorSnackBar(
            "Please select UOM in ${stockCountingDetailModel.varItemDescription}");
        isSuccess = false;
      }
    }
    return isSuccess;
  }

  _save() async {
    if (isFormValidated()) {
      List<StockCountRequestModel> requestList = [];
      CustomerModel customerModel = CustomerModel.getLoginCustomer();
      for (StockCountingDetailModel stockCountingDetailModel in items) {
        double? qty = double.tryParse(stockCountingDetailModel.quantity.text);
        requestList.add(StockCountRequestModel(
          bigintUserId: customerModel.userId,
          decInStock: stockCountingDetailModel.decInStock,
          varItemDescription: stockCountingDetailModel.varItemDescription,
          decQuantity: qty ?? stockCountingDetailModel.decQuantity,
          varDeviceNo: _deviceNumber.text,
          varItemNo: stockCountingDetailModel.varItemNo,
          varRackNo: _rackNo.text,
          varBarcode: stockCountingDetailModel.varBarcode,
          varUomCode: stockCountingDetailModel.varUomCode,
          varWarehouseCode: stockCountingDetailModel.varWarehouseCode,
        ));
      }
      if (await ServiceManager.isInternetAvailable()) {
        ServiceManager.saveStockCounting(
            requestList: requestList,
            onSuccess: () {
              items.clear();
              _rackNo.clear();
              getSuccessSnackBar('Your data is saved');
              setState(() {});
            },
            onError: (String error) {
              getErrorSnackBar(error);
            });
      }
    }
  }
}
