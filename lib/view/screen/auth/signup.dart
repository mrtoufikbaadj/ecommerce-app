import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/auth/signup_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/functions/alertexitapp.dart';
import 'package:justappecommerce/core/functions/validinput.dart';
import 'package:justappecommerce/view/widget/auth/customtextsignuporlogin.dart';
import 'package:justappecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextformauth.dart';
import 'package:justappecommerce/view/widget/auth/customtexttitleauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());

    return Scaffold(
        appBar: AppBar(
          title: Text('11'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.grey)),
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
        ),
        body: PopScope(
            canPop: true,
            onPopInvoked: (didPop) {
              alertExitApp();
            },
            child: GetBuilder<SignUpControllerImp>(
                builder: (controller) => HandlingdataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              Customtexttitleauth(
                                text: "2".tr,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Customtextbodyauth(text: "3".tr),
                              const SizedBox(
                                height: 25,
                              ),
                              Customtextformauth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 50, "username");
                                  },
                                  myController: controller.username,
                                  hintText: "12".tr,
                                  labelText: "13".tr,
                                  iconData: Icons.person_outline),
                              Customtextformauth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 100, "email");
                                  },
                                  myController: controller.email,
                                  hintText: "5".tr,
                                  labelText: "6".tr,
                                  iconData: Icons.email_outlined),
                              Customtextformauth(
                                  isNumber: true,
                                  valid: (val) {
                                    return validInput(val!, 7, 15, "phone");
                                  },
                                  myController: controller.phone,
                                  hintText: "14".tr,
                                  labelText: "15".tr,
                                  iconData: Icons.phone_android_outlined),

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
                                  iconData: Icons.lock_outline),

                              // Text(
                              //   "9".tr,
                              //   textAlign: TextAlign.end,
                              // ),
                              Custombuttomauth(
                                text: "11".tr,
                                onPressed: () {
                                  controller.signUp();
                                },
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              CustomtextSignupORLogin(
                                textOne: "16".tr,
                                textTwo: "4".tr,
                                onTap: () {
                                  controller.goToSignIn();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
