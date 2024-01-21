import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/ui/product/product_details.dart';
import 'package:flutter/material.dart';

class GeneralData extends StatefulWidget {
  @override
  _GeneralDataState createState() => _GeneralDataState();
}

class _GeneralDataState extends State<GeneralData> {
  TextEditingController ItemId = TextEditingController(
      text: ProductDetails.itemDetailModel?.bigintItemId?.toString());
  TextEditingController BarCode =
      TextEditingController(text: ProductDetails.itemDetailModel?.varBarcode);
  TextEditingController ItemNo =
      TextEditingController(text: ProductDetails.itemDetailModel?.varItemNo);
  TextEditingController ItemDescription = TextEditingController(
      text: ProductDetails.itemDetailModel?.varItemDescription);
  TextEditingController UomGroupCode = TextEditingController(
      text: ProductDetails.itemDetailModel?.varUomGroupCode);
  TextEditingController UomGroupName = TextEditingController(
      text: ProductDetails.itemDetailModel?.varUomGroupName);
  TextEditingController UomCode =
      TextEditingController(text: ProductDetails.itemDetailModel?.varUomCode);

  //------
  TextEditingController UomName =
      TextEditingController(text: ProductDetails.itemDetailModel?.varUomName);
  TextEditingController ForeignName = TextEditingController(
      text: ProductDetails.itemDetailModel?.varForeignName);
  TextEditingController ItemCategory = TextEditingController(
      text: ProductDetails.itemDetailModel?.varItemCategory);
  TextEditingController BrandName = TextEditingController(
      text: ProductDetails.itemDetailModel?.varBrandName);
  TextEditingController GroupName = TextEditingController(
      text: ProductDetails.itemDetailModel?.varGroupName);
  TextEditingController ItemImage = TextEditingController(
      text: ProductDetails.itemDetailModel?.varItemImage);
  TextEditingController LastMonthSalesQty = TextEditingController(
      text: ProductDetails.itemDetailModel?.decLastMonthSalesQty
          ?.toStringAsFixed(2));
  TextEditingController Last90DaysSalesQty = TextEditingController(
      text: ProductDetails.itemDetailModel?.decLast90DaysSalesQty
          ?.toStringAsFixed(2));
  TextEditingController LastSellingPrice = TextEditingController(
      text: ProductDetails.itemDetailModel?.decLastSellingPrice
          ?.toStringAsFixed(2));
  TextEditingController OpenOrders = TextEditingController(
      text: ProductDetails.itemDetailModel?.intOpenOrders?.toString());
  TextEditingController OpenInvoice = TextEditingController(
      text: ProductDetails.itemDetailModel?.intOpenInvoice?.toString());
  TextEditingController Ordered = TextEditingController(
      text: ProductDetails.itemDetailModel?.intOrdered?.toString());
  TextEditingController Committed = TextEditingController(
      text: ProductDetails.itemDetailModel?.intCommitted?.toString());
  TextEditingController ItemCost = TextEditingController(
      text: ProductDetails.itemDetailModel?.decItemCost?.toStringAsFixed(2));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 30),
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
                  Container(
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
                    margin:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item ID'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.bigintItemId
                                                          ?.toStringAsFixed(
                                                              2) ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(

                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Bar Code'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varBarcode ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item No'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varItemNo ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item Description'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varItemDescription ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'UOM Group Code'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varUomGroupCode ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'UOM Group Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varUomGroupName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'UOM Code'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varUomCode ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'UOM Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varUomName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Foreign Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varForeignName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item Category'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                          .itemDetailModel
                                                          ?.varItemCategory ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Brand Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.varBrandName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Group Name'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.varGroupName ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item Image'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.varItemImage ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Last Month Sales Qty'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.decLastMonthSalesQty
                                                      ?.toStringAsFixed(
                                                      2) ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text:
                                                  'Last 90 Day sSales Qty'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.decLast90DaysSalesQty
                                                      ?.toStringAsFixed(
                                                      2) ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Last Selling Price'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.decLastSellingPrice
                                                      ?.toStringAsFixed(
                                                      2) ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Open Orders'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.intOpenOrders
                                                      ?.toStringAsFixed(
                                                      2) ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Open Invoice'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.intOpenInvoice
                                                      ?.toStringAsFixed(
                                                      2) ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Ordered'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.intOrdered
                                                      ?.toStringAsFixed(
                                                      2) ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Committed'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.intCommitted
                                                      ?.toStringAsFixed(
                                                      2) ??
                                                      ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0, top: 4.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              getPoppinsTextSpanHeading(
                                                  text: 'Item Cost'),
                                              getPoppinsTextSpanDetails(
                                                  text: ProductDetails
                                                      .itemDetailModel
                                                      ?.decItemCost
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

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
