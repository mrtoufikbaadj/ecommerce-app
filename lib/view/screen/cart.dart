import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:justappecommerce/controller/cart_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/view/widget/cart/custombuttomnavigationbarcard.dart';
import 'package:justappecommerce/view/widget/cart/customitemscardlist.dart';
import 'package:justappecommerce/view/widget/cart/customtopcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("My cart"),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => CustomButtomNavigationBarCard(
                  controllercoupon: controller.controllercoupon!,
                  onApplyCoupon: () {
                    controller.checkcoupon();
                  },
                  price: "${cartController.priceorders}",
                  discount: "${cartController.discountcoupon}",
                  totalprice: "${cartController.getTotalPrice()}",
                  shipping: '400',
                )),
        body: GetBuilder<CartController>(
            builder: ((controller) => Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const SizedBox(height: 10),
                    Customtopcardcart(
                        message:
                            "You Have ${cartController.totalcountitems} Items in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                            (index) => CustomtemsICardList(
                              onAdd: () async {
                                await cartController.add(
                                    cartController.data[index].itemsId
                                        .toString(),
                                    cartController.data[index].itemsPrice
                                        .toString());
                                cartController.refreshPage();
                              },
                              onRemove: () async {
                                await cartController.delete(cartController
                                    .data[index].itemsId
                                    .toString());
                                cartController.refreshPage();
                              },
                              imagename:
                                  "${cartController.data[index].itemsImage}",
                              name: "${cartController.data[index].itemsName}",
                              price:
                                  "${cartController.data[index].itemspricewithdiscount} \$",
                              count: "${cartController.data[index].countitems}",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
