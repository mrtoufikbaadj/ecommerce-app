import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/cart_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/shared/custombutton.dart';
import 'package:justappecommerce/view/widget/cart/custombuttoncoupon.dart';
import 'package:justappecommerce/view/widget/cart/custombuttonorder.dart';

class CustomButtomNavigationBarCard extends GetView<CartController> {
  final String price;
  final String discount;
  final String totalprice;
  final String shipping;

  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const CustomButtomNavigationBarCard(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                              controller: controllercoupon,
                              decoration: const InputDecoration(
                                  hintText: "Coupon Code",
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textButton: 'Apply',
                            onPressed: onApplyCoupon,
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(10),
                    child: Card(
                        child: ListTile(
                      title: const Text(
                        "Valid coupon :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      trailing: Text(
                        "${controller.couponname!}",
                        style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ))),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Price",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$price \$",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Discount",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$discount",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Shipping",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$shipping",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Total price",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        totalprice,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButtonOrder(
            textButton: "Order",
            onPressed: () {
              controller.goToPageCheckout();
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
