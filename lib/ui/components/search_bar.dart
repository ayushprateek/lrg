import 'package:miesp/theme/custom_colors.dart';
import 'package:miesp/theme/get_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getSearchTextField({
  required TextEditingController query,
  required String searchLabel,
  required Function onClearTextField,
  required Function onSearch,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 4.0, bottom: 10, right: 4, top: 15),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: getTextFieldWithoutLookup(
            controller: query,
            labelText: searchLabel,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.clear,
                color: appPrimary,
              ),
              onPressed: () {
                onClearTextField();
              },
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: appPrimary,
            ),

            //keyboardType: TextInputType.number,
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 6),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              color: appPrimary,
              child: MaterialButton(
                onPressed: () async {
                  onSearch();
                },
                minWidth: Get.width,
                child: const FittedBox(
                  child: Text(
                    "Search",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
