import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/auth/login_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/core/functions/alertexitapp.dart';
import 'package:justappecommerce/core/functions/validinput.dart';
import 'package:justappecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextformauth.dart';
import 'package:justappecommerce/view/widget/auth/customtextsignuporlogin.dart';
import 'package:justappecommerce/view/widget/auth/customtexttitleauth.dart';
import 'package:justappecommerce/view/widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // get onWillPop => alertExitApp();

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text('4'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.grey)),
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
        ),
        body: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              alertExitApp();
            },
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingdataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const Logoauth(),
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
                                  return validInput(val!, 5, 100, "email");
                                },
                                myController: controller.email,
                                hintText: "5".tr,
                                labelText: "6".tr,
                                iconData: Icons.email_outlined,
                              ),
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => Customtextformauth(
                                    obsecureText: controller.isshowPassword,
                                    onTapIcon: () {
                                      controller.showPassword();
                                    },
                                    isNumber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 30, "password");
                                    },
                                    myController: controller.password,
                                    hintText: "7".tr,
                                    labelText: "8".tr,
                                    iconData: Icons.lock_outline),
                              ),
                              InkWell(
                                  onTap: () {
                                    controller.goToForgotPassword();
                                  },
                                  child: Text(
                                    "9".tr,
                                    textAlign: TextAlign.end,
                                  )),
                              Custombuttomauth(
                                text: "4".tr,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomtextSignupORLogin(
                                textOne: "10".tr,
                                textTwo: "11".tr,
                                onTap: () {
                                  controller.goToSignUp();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
