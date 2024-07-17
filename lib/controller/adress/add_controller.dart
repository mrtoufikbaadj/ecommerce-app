import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';

class AddAdressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completecontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  addMarkers(LatLng latLong) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLong));
    lat = latLong.latitude;
    long = latLong.longitude;
    update();
  }

  goToPageAddDetailsAdress() {
    Get.toNamed(AppRout.addadressdetails, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
    });
  }

  Position? position;

  CameraPosition? kGooglePlex;

  getcurrentlocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getcurrentlocation();
    completecontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
