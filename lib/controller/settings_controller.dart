import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPreferences.getString('id')!;

    FirebaseMessaging.instance
        .unsubscribeFromTopic("users"); //topic notification to all users
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");

    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRout.login);
  }
}
