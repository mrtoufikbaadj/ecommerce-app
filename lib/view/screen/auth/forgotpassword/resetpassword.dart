import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/forgetpassword/resetpassword_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/functions/validinput.dart';
import 'package:justappecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextformauth.dart';
import 'package:justappecommerce/view/widget/auth/customtexttitleauth.dart';

class RessetPassword extends StatelessWidget {
  const RessetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text('31'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.grey)),
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => HandlingdataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          Customtexttitleauth(
                            text: "32".tr,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Customtextbodyauth(text: "33".tr),
                          const SizedBox(
                            height: 25,
                          ),
                          Customtextformauth(
                            // obsecureText: controller.isshowPassword,
                            // onTapIcon: () {
                            //   controller.showPassword();
                            // },
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            myController: controller.password,
                            hintText: "7".tr,
                            labelText: "8".tr,
                            iconData: Icons.lock_outline,
                          ),
                          Customtextformauth(
                              // obsecureText: controller.isshowPassword,
                              // onTapIcon: () {
                              //   controller.showPassword();
                              // },
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 30, "password");
                              },
                              myController: controller.repassword,
                              hintText: "35".tr,
                              labelText: "8".tr,
                              iconData: Icons.lock_outline),
                          Custombuttomauth(
                            text: "34".tr,
                            onPressed: () {
                              controller.goToSuccessResetPassword();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
