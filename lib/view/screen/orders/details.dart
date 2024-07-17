import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:justappecommerce/controller/orders/details_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Table(
                            // border: TableBorder.all(
                            //     color: AppColor.primaryColor,
                            //     borderRadius: BorderRadius.circular(10)),
                            children: [
                              const TableRow(children: [
                                Text(
                                  "Items",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ]),
                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                  Text(
                                    "${controller.data[index].itemsName}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].countitems}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].cartitemsprice}",
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                                'Total Price : ${controller.ordersmodel!.ordersTotalprice} \$',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersmodel.ordersType == 0)
                    Card(
                      child: Container(
                        child: ListTile(
                          title: Text("shipping Adress",
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "${controller.ordersmodel!.adressStreet} ${controller.ordersmodel.adressCity}"),
                        ),
                      ),
                    ),
                  if (controller.ordersmodel.ordersType == 0)
                    Card(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 300,
                            width: double.infinity,
                            child: GoogleMap(
                              mapType: MapType.normal,
                              markers: controller.markers.toSet(),
                              onTap: (latLong) {
                                //  controller.addMarkers(latLong);
                              },
                              initialCameraPosition: controller.cameraPosition,
                              onMapCreated:
                                  (GoogleMapController controllermap) {
                                controller.completecontroller
                                    ?.complete(controllermap);
                              },
                            )))
                ],
              ),
            ),
          )),
    );
  }
}
