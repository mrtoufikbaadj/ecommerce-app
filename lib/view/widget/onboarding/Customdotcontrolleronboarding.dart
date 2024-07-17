import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/onboarding_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/data/datasource/static/static.dart';

class Customdotcontrolleronboarding extends StatelessWidget {
  const Customdotcontrolleronboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 15 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
