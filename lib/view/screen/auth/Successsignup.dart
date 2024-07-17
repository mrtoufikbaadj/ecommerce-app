import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/auth/successsignup_controller.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/view/widget/auth/custombuttomauth.dart';

class Successsignup extends StatelessWidget {
  const Successsignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('37'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.grey)),
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text("38".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 23)),
            Text("39".tr),
            Spacer(),
            Container(
              width: double.infinity,
              child: Custombuttomauth(
                text: "40".tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
