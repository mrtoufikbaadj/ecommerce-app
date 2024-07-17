import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/forgetpassword/forgotpassword_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/functions/validinput.dart';
import 'package:justappecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextformauth.dart';
import 'package:justappecommerce/view/widget/auth/customtexttitleauth.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgotPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text('9'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.grey)),
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
        ),
        body: GetBuilder<ForgotPasswordControllerImp>(
            builder: (controller) => HandlingdataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          Customtexttitleauth(
                            text: "25".tr,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Customtextbodyauth(text: "29".tr),
                          const SizedBox(
                            height: 25,
                          ),
                          Customtextformauth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              myController: controller.email,
                              hintText: "5".tr,
                              labelText: "6".tr,
                              iconData: Icons.email_outlined),
                          Custombuttomauth(
                            text: "26".tr,
                            onPressed: () {
                              // controller.goToVerifyCode();
                              controller.checkEmail();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
