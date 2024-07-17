import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/onboarding_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/data/datasource/static/static.dart';

class Customslideronboarding extends GetView<OnBordingControllerImp> {
  const Customslideronboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(height: 60),
                Text(
                  onBoardingList[i].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                      fontSize: 20),
                ),
                const SizedBox(height: 60),
                Image.asset(
                  onBoardingList[i].image!,
                  width: 200,
                  height: 220,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        height: 2, color: AppColor.grey, fontSize: 15),
                  ),
                )
              ],
            ));
  }
}
