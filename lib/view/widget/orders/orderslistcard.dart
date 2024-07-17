import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:justappecommerce/controller/orders/pending_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/data/model/ordersmodel.dart';

class CardOrderList extends GetView<PendingOrdersController> {
  final OrdersModel listdata;
  const CardOrderList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listdata.ordersId}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                //Text(listdata.ordersDatetime!),
                Text(
                  Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(),
            Text(
              "Order Type :  ${controller.printOrdersType(listdata.ordersType.toString())}",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Payment Method :  ${controller.printPaymentMethod(listdata.ordersPaymentmethod.toString())}",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Order Status :  ${controller.printOrderStatus(listdata.ordersStatus.toString())}",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Order Price :  ${listdata.ordersPrice}",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Delivery Price :  ${listdata.ordersPricedelivery}",
              style: TextStyle(fontSize: 15),
            ),
            Divider(),
            Row(
              children: [
                Text(
                  "Total Price :  ${listdata.ordersTotalprice}",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRout.ordersdetails, arguments: {
                      "ordersmodel": listdata,
                    });
                  },
                  color: AppColor.secondColor,
                  textColor: Colors.white,
                  child: Text("Details"),
                ),
                const SizedBox(width: 10),
                // if (listdata.ordersType == 0)
                // MaterialButton(
                //   onPressed: () {
                //     controller.deleteOrder(listdata.ordersId.toString());
                //   },
                //   color: AppColor.secondColor,
                //   textColor: Colors.white,
                //   child: Text("Delete"),
                // ),
                if (listdata.ordersStatus == 3)
                  MaterialButton(
                    onPressed: () {
                      controller.goToPageTrackingOrders(listdata);
                    },
                    color: AppColor.secondColor,
                    textColor: Colors.white,
                    child: Text("Tracking"),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
