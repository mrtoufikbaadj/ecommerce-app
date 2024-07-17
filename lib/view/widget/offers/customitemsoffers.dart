import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/favorite_controller.dart';
import 'package:justappecommerce/controller/offers_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/imageasset.dart';
import 'package:justappecommerce/core/functions/translatdatabase.dart';
import 'package:justappecommerce/data/model/itemsmodel.dart';
import 'package:justappecommerce/linkapi.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItemsOffers({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl: Applink.imagesitems +
                              "/" +
                              itemsModel.itemsImage!,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          translatdatabase(
                              itemsModel.itemsNameAr, itemsModel.itemsName),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text("Rating 3.5 ",
                      //         textAlign: TextAlign.center),
                      //     Container(
                      //       alignment: Alignment.bottomCenter,
                      //       height: 22,
                      //       child: Row(
                      //         children: [
                      //           ...List.generate(
                      //               5,
                      //               (index) => const Icon(
                      //                     Icons.star,
                      //                     size: 15,
                      //                   ))
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.itemsPriceDiscount} \$",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller
                                            .isFavorite[itemsModel.itemsId] ==
                                        1) {
                                      controller.setFavorite(
                                          itemsModel.itemsId, 0);
                                      controller.removeFavorite(
                                          itemsModel.itemsId!.toString());
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.itemsId, 1);
                                      controller.addFavorite(
                                          itemsModel.itemsId!.toString());
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemsId] ==
                                            1
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  )))
                        ],
                      )
                    ]),
              ),
              if (itemsModel.itemsDiscount != 0)
                Positioned(
                    top: 4,
                    left: 4,
                    child: Image.asset(
                      AppImageAsset.sale,
                      width: 40,
                    ))
            ],
          ),
        ));
  }
}
