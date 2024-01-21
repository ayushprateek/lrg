import 'dart:async';
import 'dart:io';

import 'package:miesp/common/app_assets.dart';
import 'package:miesp/models/warehouse_model.dart';
import 'package:miesp/services/service_manager.dart';
import 'package:miesp/theme/custom_text_widgets.dart';
import 'package:miesp/theme/elements_screen.dart';
import 'package:miesp/ui/components/back_pressed_warning.dart';
import 'package:miesp/ui/components/custom_drawer.dart';
import 'package:miesp/ui/components/elements_button.dart';
import 'package:miesp/ui/components/elements_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedWarehouse = '';
  Set<String> warehouseList = {};
  String loadingText = 'Loading warehouses...';
  final key = GlobalKey<ScaffoldState>();
  WarehouseModel? warehouse;

  @override
  void initState() {
    super.initState();
    warehouse = WarehouseModel.getSelectedWarehouse();
    loadWarehouseData();
    if (warehouse != null) {
      Timer(Duration(milliseconds: 100), () {
        key.currentState?.openDrawer();
      });
    }
  }

  _onBackButtonPressed() {
    showBackPressedWarning(
        onBackPressed: () {
          exit(0);
        },
        text: 'Are you sure you want to terminate the app?');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool bb) async {
        await _onBackButtonPressed();
      },
      canPop: false,
      child: screenWithAppBar(
          title: appName,
          key: key,
          drawer: const CustomDrawer(),
          leading: IconButton(onPressed: (){
            if (warehouse != null) {
              Timer(Duration(milliseconds: 100), () {
                key.currentState?.openDrawer();
              });
            }
            else
              {
                getErrorSnackBar('Warehouse not saved!!');
              }
          }, icon: Icon(Icons.menu,color: Colors.white,)),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getHeadingText(text: 'Warehouse'),
              const SizedBox(
                height: 20,
              ),
              if (warehouseList.isEmpty)
                Align(
                    alignment: Alignment.center,
                    child: getSubHeadingText(text: loadingText))
              else
                Align(alignment: Alignment.center, child: _dropdownButton()),
            ],
          ),
          bottomNavigationBar:
              warehouseList.isNotEmpty ? _buttonContainer() : null),
    );
  }

  Widget _dropdownButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 15, right: 20),
      child: SizedBox(
        width: Get.width / 1.2,
        child: FittedBox(
          child: DropdownButton<String>(
            value: selectedWarehouse,
            onChanged: (String? newValue) {
              setState(() {
                selectedWarehouse = newValue!;
              });
            },
            items: warehouseList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: FittedBox(child: Text(value)),
              );
            }).toList(),
          ),
        ),
      ),
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
          btnText: 'Save warehouse',
          fontSize: 16,
          onPress: _onSave,
        ),
      ),
    );
  }

  loadWarehouseData() async {
    if (await ServiceManager.isInternetAvailable()) {
      ServiceManager.getWarehouseList(onSuccess: onSuccess, onError: onError);
    }
  }

  onSuccess(List<WarehouseModel> warehouseList) {
    if (warehouseList.isNotEmpty) {
      if (warehouse == null) {
        WarehouseModel warehouse = warehouseList[0];
        selectedWarehouse =
            '${warehouse.warehouseCode}-->${warehouse.warehouseName}';
      } else {
        selectedWarehouse =
            '${warehouse?.warehouseCode}-->${warehouse?.warehouseName}';
      }
    }
    for (WarehouseModel warehouse in warehouseList) {
      this
          .warehouseList
          .add('${warehouse.warehouseCode}-->${warehouse.warehouseName}');
    }
    setState(() {});
  }

  onError() {
    loadingText = 'Error loading warehouses';
  }

  _onSave() async {
    List l = selectedWarehouse.split('-->');
    warehouse = WarehouseModel(
      warehouseCode: l[0],
      warehouseName: l[1],
    );
    WarehouseModel.setSelectedWarehouse(warehouseModel: warehouse!);
    getSuccessSnackBar('Warehouse saved');

    key.currentState?.openDrawer();
  }
}
