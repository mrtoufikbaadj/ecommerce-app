import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/checkout_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/imageasset.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/view/widget/checkout/carddeliverytype.dart';
import 'package:justappecommerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:justappecommerce/view/widget/checkout/cardshippingadress.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) =>
              //  Handlingdataview(
              //   statusRequest: controller.statusRequest,
              //   widget:
              Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                const Text(
                  "Choose Payment Method :",
                  style: TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.choosePymentMethod("0"); // 0  => cash
                  },
                  child: CardPaymentMethod(
                      titile: "Cash On Delivery",
                      isActive: controller.paymentMethod == "0"
                          ? false
                          : true), // 0  => cash
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    controller.choosePymentMethod("1"); // 1  => card
                  },
                  child: CardPaymentMethod(
                      titile: "Payment Card",
                      isActive: controller.paymentMethod == "1"
                          ? false
                          : true), // 1  => card
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Choose Delivery Type :",
                  style: TextStyle(
                      color: AppColor.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("0"); // 0  => delivery
                      },
                      child: CardDeliveryType(
                        imagename: AppImageAsset.delevry,
                        isActive:
                            controller.deliverType == "0" // 0  => delivery
                                ? true
                                : false,
                        title: "Delivery",
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("1"); // 1  => DriveThru
                      },
                      child: CardDeliveryType(
                        imagename: AppImageAsset.drivethru,
                        isActive:
                            controller.deliverType == "1" // 1  => DriveThru
                                ? true
                                : false,
                        title: "Drive Thru",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                if (controller.deliverType == "0")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.dataAdress.isNotEmpty)
                        const Text(
                          "Shipping Adress :",
                          style: TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      if (controller.dataAdress.isEmpty)
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRout.adressadd);
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "Please Add Shippinh Adress , \n Click here to add adress",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      ...List.generate(
                          controller.dataAdress.length,
                          (i) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAdress(
                                      controller.dataAdress[i].adressId!);
                                },
                                child: Cardshippingadress(
                                    title:
                                        "${controller.dataAdress[i].adressName}",
                                    body:
                                        "${controller.dataAdress[i].adressStreet}  ${controller.dataAdress[i].adressCity}",
                                    isActive: controller.adressId ==
                                            controller.dataAdress[i].adressId!
                                        ? true
                                        : false),
                              )),
                    ],
                  )
              ],
            ),
          ),
          // ),
        ));
  }
}
