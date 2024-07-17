import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/myfavorite_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/view/widget/customappbar.dart';
import 'package:justappecommerce/view/widget/favorite/customlistfavoriteitems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
          child: GetBuilder<MyFavoriteController>(
        builder: (controller) => ListView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          children: [
            // Customappbar(
            //   titleappbar: "Find Product",
            //   // onPressedIcon: () {},
            //   onPressedSearch: () {},
            //   onPressedIconFavorite: () {
            //     Get.toNamed(AppRout.myfavorite);
            //   },
            // ),
            Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return Customlistfavoriteitems(
                        favoriteitemsModel: controller.data[index]);
                  },
                ))
          ],
        ),
      )),
    );
  }
}
