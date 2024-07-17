import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/favorite_controller.dart';
import 'package:justappecommerce/controller/items_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/data/model/itemsmodel.dart';
import 'package:justappecommerce/view/screen/home.dart';
import 'package:justappecommerce/view/widget/customappbar.dart';
import 'package:justappecommerce/view/widget/items/customlistitems.dart';
import 'package:justappecommerce/view/widget/items/listcategoriesitems.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
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
          const SizedBox(height: 20),
          const ListcategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.7),
                          itemBuilder: (BuildContext context, index) {
                            controllerFav.isFavorite[controller.data[index]
                                    ['items_id']] =
                                controller.data[index]['favorite'];
                            return CustomListItems(
                                itemsModel: ItemsModel.fromJson(
                                    controller.data[index]));
                          })
                      : ListItemsSearch(listdatamodel: controller.listdat)))
        ]),
      ),
    );
  }
}

// favoriteController.isFavorite[controller.data[index]
// ['items_id']] = controller.data[index]['favorite'];

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:justappecommerce/controller/favorite_controller.dart';
// import 'package:justappecommerce/controller/items_controller.dart';
// import 'package:justappecommerce/core/class/handlingdataview.dart';
// import 'package:justappecommerce/data/model/itemsmodel.dart';
// import 'package:justappecommerce/view/widget/customappbar.dart';
// import 'package:justappecommerce/view/widget/items/customlistitems.dart';
// import 'package:justappecommerce/view/widget/items/listcategoriesitems.dart';

// class ItemsPage extends StatelessWidget {
//   const ItemsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ItemsControllerImp());
//     FavoriteController controllerFav = Get.put(FavoriteController());

//     return Scaffold(
//       body: Container(
//           padding: const EdgeInsets.all(15),
//           child: ListView(children: [
//             Customappbar(
//                 titleappbar: "Find Product",
//                 onPressedIcon: () {},
//                 onPressedSearch: () {}),
//             const SizedBox(height: 20),
//             const ListcategoriesItems(),
//             GetBuilder<ItemsControllerImp>(
//                 builder: (controller) => Handlingdataview(
//                     statusRequest: controller.statusRequest,
//                     widget: GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: controller.data.length,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2, childAspectRatio: 0.7),
//                         itemBuilder: (BuildContext context, i) {
//                           controllerFav
//                                   .isFavorite[controller.data[i]['items_id']] =
//                               controller.data[i]['favorite'];
//                           return CustomListItems(
//                             itemsModel: ItemsModel.fromJson(controller.data[i]),
//                           );
//                         })))
//           ])),
//     );
//   }
// }
