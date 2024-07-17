import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/adress_data.dart';

class AddAdressDetailsController extends GetxController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  String? lat;
  String? long;

  AdressData adressData = AdressData(Get.find());

  List data = [];

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print(lat);
    print(long);
  }

  addAdress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await adressData.addData(
        myServices.sharedPreferences.getString('id')!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    print("====================== controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRout.homepage);
        Get.snackbar('Alert', "Now you can order to this adress");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
