import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/localization/changelocal.dart';
import 'package:justappecommerce/view/widget/language/custombuttonlang.dart';

class Language extends GetView<localController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Language'),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '1'.tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 40,
          ),
          Custombuttonlang(
              textButton: 'Ar',
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRout.onBoarding);
              }),
          Custombuttonlang(
              textButton: 'En',
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRout.onBoarding);
              })
        ],
      ),
    );
  }
}
