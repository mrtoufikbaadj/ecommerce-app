import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/orders/details_data.dart';
import 'package:justappecommerce/data/model/cartmodel.dart';
import 'package:justappecommerce/data/model/ordersmodel.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];
  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  late OrdersModel ordersmodel;

  Completer<GoogleMapController>? completecontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  Position? position;

  late CameraPosition cameraPosition;

  initialDat() {
    if (ordersmodel.ordersType == 0) {
      cameraPosition = CameraPosition(
        // target: LatLng(position!.latitude, position!.longitude),
        target: LatLng(ordersmodel.adressLat!.toDouble(),
            ordersmodel.adressLong!.toDouble()),

        zoom: 12.4746,
      );

      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(double.parse(ordersmodel.adressLat.toString()),
              double.parse(ordersmodel.adressLong.toString()))));
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(ordersmodel!.ordersId.toString());
    print("====================== controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordersmodel'];
    initialDat();
    getData();
    super.onInit();
  }
}
