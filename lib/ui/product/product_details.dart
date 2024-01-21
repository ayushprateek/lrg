import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miesp/custom_scanner.dart';
import 'package:miesp/models/item_details_model.dart';
import 'package:miesp/theme/custom_colors.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/ui/components/back_pressed_warning.dart';
import 'package:miesp/ui/product/general_data.dart';
import 'package:miesp/ui/product/price_list.dart';
import 'package:miesp/ui/product/stock.dart';

class ProductDetails extends StatefulWidget {
  int index = 0;
  static ItemDetailModel? itemDetailModel;

  ProductDetails({
    required this.index,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
  }

  final key = GlobalKey<ScaffoldState>();

  _onBackButtonPressed() {
    showBackPressedWarning(onBackPressed: () {
      Get.offUntil(MaterialPageRoute(builder: (context) => CustomScanner()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool bb) async {
        await _onBackButtonPressed();
      },
      canPop: false,
      child: DefaultTabController(
        length: 3,
        initialIndex: widget.index,
        child: Scaffold(
          key: key,
          appBar: AppBar(
              elevation: 10.0,
              backgroundColor: appPrimary,
              leading: IconButton(
                onPressed: () {
                  showBackPressedWarning(onBackPressed: null);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              bottom: PreferredSize(
                child: Column(
                  children: [
                    TabBar(
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.white),
                      labelColor: appPrimary,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      unselectedLabelColor: Colors.white,
                      labelStyle:
                          GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      tabs: [
                        Tab(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12),
                            child: Text("General Data"),
                          ),
                        ),
                        Tab(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12),
                          child: Text(
                            "Price List",
                          ),
                        )),
                        Tab(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12),
                          child: Text(
                            "Stock",
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(50.0),
              ),
              // actions: [
              //   IconButton(
              //     tooltip: 'Cancel Document',
              //     icon: Icon(
              //       Icons.clear,
              //       color: Colors.red,
              //     ),
              //     onPressed: () {
              //       showBackPressedWarning(
              //           text: 'Are you sure you want to cancel this document?',
              //           onBackPressed: () async {
              //             Get.offAll(() => SalesQuotationUI(
              //                   index: 0,
              //                 ));
              //             getErrorSnackBar('Document Cancelled');
              //           });
              //     },
              //   ),
              //   IconButton(
              //     tooltip: 'Search Document',
              //     icon: Icon(
              //       Icons.search,
              //       color: Colors.white,
              //     ),
              //     onPressed: () {
              //       // Navigator.push(
              //       //     context,
              //       //     MaterialPageRoute(
              //       //         builder: (context) => SalesQuotationUISearch()));
              //     },
              //   ),
              //   IconButton(
              //     tooltip: "Add New Document",
              //     icon: Icon(
              //       Icons.add,
              //       color: Colors.black,
              //     ),
              //     onPressed: () {
              //       showBackPressedWarning(
              //           text:
              //               'Your data is not saved. Are you sure you want to create new form?',
              //           onBackPressed: () async {
              //             Get.offAll(() => SalesQuotationUI(
              //                   index: 0,
              //                 ));
              //             getSuccessSnackBar('New Document created');
              //           });
              //     },
              //   ),
              // ],
              title: getHeadingText(
                  text: "Product Details", color: headColor, fontSize: 20)),
          body: TabBarView(
            children: [
              GeneralData(),
              PriceList(),
              Stock(),
            ],
          ),

          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: appPrimary,
          //   tooltip: "Save Data",
          //   child: getHeadingText(text: "Save", color: Colors.white),
          //   onPressed: () async {
          //     showLoaderDialog(context, text: 'Saving your data');
          //     await Future.delayed(Duration(seconds: 3));
          //     Get.offAll(() => SalesQuotationUI(
          //           index: 0,
          //         ));
          //     getSuccessSnackBar('Data saved');
          //   },
          // ),
        ),
      ),
    );
  }
}
