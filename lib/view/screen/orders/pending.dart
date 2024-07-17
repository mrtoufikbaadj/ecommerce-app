import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/orders/pending_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/view/widget/orders/orderslistcard.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<PendingOrdersController>(
            builder: (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CardOrderList(
                  listdata: controller.data[index],
                ),
              ),
            ),
          )),
    );
  }
}
