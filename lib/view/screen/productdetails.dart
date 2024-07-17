import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/productdetails_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/view/widget/productdetails/custompriceandcount.dart';
import 'package:justappecommerce/view/widget/productdetails/subitemslist.dart';
import 'package:justappecommerce/view/widget/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 50,
          width: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.fourthColor,
            onPressed: () {
              Get.toNamed(AppRout.cart);
            },
            child: const Text(
              "Go To Cart",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const Toppageproductdetails(),
                const SizedBox(
                  height: 90,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.itemsModel.itemsName}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColor.fourthColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Custompriceandcount(
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                          price: "${controller.itemsModel.itemsPriceDiscount}",
                          count: "${controller.countitems}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("${controller.itemsModel.itemsDesc}",
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Color",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColor.fourthColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Subitemslist(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
