import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/orders/archive_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/view/widget/orders/orderslistcard.dart';
import 'package:justappecommerce/view/widget/orders/orderslistcardarchive.dart';

class ArchiveOdersView extends StatelessWidget {
  const ArchiveOdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<ArchiveOrdersController>(
            builder: (controller) => Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => CardOrderListArchive(
                  listdata: controller.data[index],
                ),
              ),
            ),
          )),
    );
  }
}
