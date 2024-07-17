import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/home_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/data/model/itemsmodel.dart';
import 'package:justappecommerce/linkapi.dart';
import 'package:justappecommerce/view/widget/customappbar.dart';
import 'package:justappecommerce/view/widget/home/customcardhome.dart';
import 'package:justappecommerce/view/widget/home/customtitlehome.dart';
import 'package:justappecommerce/view/widget/home/listcategories.dart';
import 'package:justappecommerce/view/widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
            Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Customcardhome(
                            title: "${controller.titleHomeCart}",
                            body: "${controller.bodyHomeCart}",
                          ),
                          const Customtitlehome(title: "Categories"),
                          const Listcategories(),
                          const Customtitlehome(title: "Top Selling"),
                          const Listitemshome(),
                          const Customtitlehome(title: "Offer for you"),
                          const Listitemshome(),
                        ],
                      )
                    : ListItemsSearch(listdatamodel: controller.listdat))
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageProductDetails(listdatamodel[index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${Applink.imagesitems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        child: ListTile(
                      title: Text("${listdatamodel[index].itemsName}"),
                      subtitle: Text("${listdatamodel[index].categoriesName}"),
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
