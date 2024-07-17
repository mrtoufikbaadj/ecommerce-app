import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/homescreen_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/alertexitapp.dart';
import 'package:justappecommerce/view/widget/home/custombuttomappbarhome.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRout.cart);
                },
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const Custombuttomappbarhome(),
              body: PopScope(
                  canPop: false,
                  onPopInvoked: (didPop) {
                    alertExitApp();
                  },
                  child: controller.listPage.elementAt(controller.currentPage)),
            )
        //
        );
  }
}
