import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/myfavorite_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/functions/translatdatabase.dart';
import 'package:justappecommerce/data/model/myfavoritemodel.dart';
import 'package:justappecommerce/linkapi.dart';

class Customlistfavoriteitems extends GetView<MyFavoriteController> {
  final MyFavoriteModel favoriteitemsModel;
  // final bool active;
  const Customlistfavoriteitems({super.key, required this.favoriteitemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //  controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${favoriteitemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${Applink.imagesitems}/${favoriteitemsModel.itemsImage}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      translatdatabase(favoriteitemsModel.itemsNameAr,
                          favoriteitemsModel.itemsName),
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rating 3.5 ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${favoriteitemsModel.itemsPrice} \$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      IconButton(
                        onPressed: () {
                          controller.deleteFromFavorite(
                              favoriteitemsModel.favoriteId);
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: AppColor.primaryColor,
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ));
  }
}
