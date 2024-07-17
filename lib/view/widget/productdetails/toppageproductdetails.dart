import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/productdetails_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/linkapi.dart';

class Toppageproductdetails extends GetView<ProductDetailsControllerImp> {
  const Toppageproductdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.fourthColor,
          ),
        ),
        Positioned(
          top: 40,
          right: Get.width / 10,
          left: Get.width / 10,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${Applink.imagesitems}/${controller.itemsModel.itemsImage}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
