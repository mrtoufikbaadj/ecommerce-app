import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/home_controller.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/data/datasource/remote/offers_data.dart';
import 'package:justappecommerce/data/model/itemsmodel.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    print("====================== controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
