import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) =>
      myServices.sharedPreferences.getString("step") == "2"
          ? const RouteSettings(name: AppRout.homepage)
          : myServices.sharedPreferences.getString("step") == "1"
              ? const RouteSettings(name: AppRout.login)
              : null;
}
