import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/home_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/data/model/itemsmodel.dart';
import 'package:justappecommerce/linkapi.dart';

class Listitemshome extends GetView<HomeControllerImp> {
  const Listitemshome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Items(itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class Items extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: CachedNetworkImage(
              imageUrl: "${Applink.imagesitems}/${itemsModel.itemsImage}",
              height: 140,
              width: 200,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            height: 160,
            width: 200,
          ),
          Positioned(
              left: 30,
              top: 20,
              child: Text(
                "${itemsModel.itemsName}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ))
        ],
      ),
    );
  }
}
