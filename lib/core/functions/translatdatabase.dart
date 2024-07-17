import 'package:get/get.dart';
import 'package:justappecommerce/core/services/services.dart';

translatdatabase(columnar, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
