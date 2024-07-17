import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  LoginData loginData = LoginData(Get.find());

  late TextEditingController email;
  late TextEditingController password;
  //late TextEditingController repassword;

  bool isshowPassword = true;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowPassword = isshowPassword == true ? false : true;
    update();
  }

  login();

  goToSignUp();
  goToForgotPassword() {}
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            ////////////topic//////////////
            FirebaseMessaging.instance
                .subscribeToTopic("users"); //topic notification to all users

            FirebaseMessaging.instance.subscribeToTopic("users$userid");

            //topic notification just for this user

            ////////////topic//////////////

            Get.offNamed(AppRout.homepage);
          } else {
            Get.toNamed(AppRout.verifycodesignup,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRout.signup);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });

    email = TextEditingController();
    password = TextEditingController();
    //repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    //repassword.dispose();
    super.dispose();
  }

  @override
  goToForgotPassword() {
    Get.toNamed(AppRout.forgotpassword);
  }
}
