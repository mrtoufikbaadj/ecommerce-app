import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/auth/verifycodesignup_controller.dart';
import 'package:justappecommerce/core/class/handlingdataview.dart';
import 'package:justappecommerce/core/constant/color.dart';
import 'package:justappecommerce/view/widget/auth/customtextbodyauth.dart';
import 'package:justappecommerce/view/widget/auth/customtexttitleauth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text('27'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: Colors.grey)),
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            builder: (controller) => HandlingdataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: ListView(
                      children: [
                        Customtexttitleauth(
                          text: "28".tr,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Customtextbodyauth(
                            text: "${"30".tr}${controller.email!}"),
                        const SizedBox(
                          height: 25,
                        ),
                        OtpTextField(
                            borderRadius: BorderRadius.circular(20),
                            numberOfFields: 5,
                            borderColor: Color(0xFF512DA8),
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.goToSuccessSignup(verificationCode);
                            }),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            controller.resend();
                          },
                          child: Center(
                              child: Text(
                            "Resend Verify Code",
                            style: TextStyle(
                                color: AppColor.primaryColor, fontSize: 18),
                          )),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
