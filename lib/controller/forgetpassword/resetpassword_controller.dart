import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/data/datasource/remote/forgetpassword/ressetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;

  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  RessetPasswordData ressetPasswordData = RessetPasswordData(Get.find());

  resetpassword();

  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password Not Match");
    }
    var Formdata = formstate.currentState;
    if (Formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await ressetPasswordData.postdata(email!, password.text);
      print("=============================== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRout.successresetpassword);
        } else {
          Get.defaultDialog(title: "ُWarning", middleText: "Try Again");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
