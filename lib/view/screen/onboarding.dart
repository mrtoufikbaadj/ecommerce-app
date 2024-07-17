import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/onboarding_controller.dart';
import 'package:justappecommerce/view/widget/onboarding/Customdotcontrolleronboarding.dart';
import 'package:justappecommerce/view/widget/onboarding/customslideronboarding.dart';
import 'package:justappecommerce/view/widget/onboarding/custombutomonboarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          child: Customslideronboarding(),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Customdotcontrolleronboarding(),
                Spacer(
                  flex: 2,
                ),
                Custombutomonboarding(),
                Spacer(
                  flex: 1,
                ),
              ],
            ))
      ],
    )));
  }
}
