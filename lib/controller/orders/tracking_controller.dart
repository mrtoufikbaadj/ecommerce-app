import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/getdecodepolyline.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/model/ordersmodel.dart';

class TrackingOrdersController extends GetxController {
  MyServices myServices = Get.find();

//  Set<Polyline> plylineSet = {};

  GoogleMapController? gmc;

  late CameraPosition cameraPosition;

  List<Marker> markers = [];

  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersmodel;

  double? destinationlat;
  double? destinationlong;

  double? currentlat;
  double? currentlong;

  initialData() {
    cameraPosition = CameraPosition(
      // target: LatLng(position!.latitude, position!.longitude),
      target: LatLng(ordersmodel.adressLat!.toDouble(),
          ordersmodel.adressLong!.toDouble()),

      zoom: 12.4746,
    );
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId("current"),
        position: LatLng(double.parse(ordersmodel.adressLat.toString()),
            double.parse(ordersmodel.adressLong.toString()))));

    update();
  }

  getLocationDelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersmodel.ordersId.toString())
        .snapshots()
        .listen(
      (event) {
        if (event.exists) {
          destinationlat = event.get('lat');
          destinationlong = event.get('long');
          updateMarkerDelivery(destinationlat!, destinationlong!);
        }
      },
    );
  }

  updateMarkerDelivery(double newlat, double newlong) {
    markers.removeWhere((element) => element.markerId.value == "destination");
    markers.add(Marker(
        markerId: const MarkerId("destination"),
        position: LatLng(newlat, newlong)));
    update();
  }

  // initpolyline() async {
  //   destinationlat = ordersmodel.adressLat!.toDouble();
  //   destinationlat = ordersmodel.adressLong!.toDouble();
  //   await Future.delayed(Duration(seconds: 1));
  //   plylineSet = await getPolyline(
  //       currentlat, currentlong, destinationlat, destinationlong);
  //   update();
  // }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordersmodel'];
    initialData();
    getLocationDelivery();
    // initpolyline();

    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();
    super.onClose();
  }
}


//  1- getcurrent location

//  2-  tracking opearation