import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/favorite_controller.dart';
import 'package:justappecommerce/controller/offers_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/view/screen/home.dart';
import 'package:justappecommerce/view/widget/customappbar.dart';
import 'package:justappecommerce/view/widget/offers/customitemsoffers.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                children: [
                  Customappbar(
                    mycontroller: controller.search!,
                    titleappbar: "Find Product",
                    onChanged: (val) {
                      controller.checksearch(val);
                    },
                    onPressedSearch: () {
                      controller.onsearchitems();
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRout.myfavorite);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  !controller.isSearch
                      ? Handlingdataview(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) =>
                                CustomListItemsOffers(
                                    itemsModel: controller.data[index]),
                          ))
                      : ListItemsSearch(listdatamodel: controller.listdat)
                ],
              ),
            ));
  }
}
