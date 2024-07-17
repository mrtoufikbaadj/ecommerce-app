import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:justappecommerce/controller/orders/tracking_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingOrdersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Tracking'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<TrackingOrdersController>(
            builder: (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  if (controller.ordersmodel.ordersType == 0)
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: GoogleMap(
                            // polylines: controller.plylineSet,
                            mapType: MapType.normal,
                            markers: controller.markers.toSet(),
                            initialCameraPosition: controller.cameraPosition,
                            onMapCreated: (GoogleMapController controllerMap) {
                              controller.gmc = controllerMap;
                            },
                          )),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
