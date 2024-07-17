import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/onboarding_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';

class Custombutomonboarding extends GetView<OnBordingControllerImp> {
  const Custombutomonboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: const Text("Continue"),
      ),
    );
  }
}
