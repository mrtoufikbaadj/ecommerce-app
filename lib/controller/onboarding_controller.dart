import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/static/static.dart';

abstract class OnBordingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBordingControllerImp extends OnBordingController {
  late PageController pageController;
  int currentPage = 0;

  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRout.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
    //throw UnimplementedError();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
