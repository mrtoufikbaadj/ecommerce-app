import 'package:get/get.dart';
import 'package:justappecommerce/controller/auth/signup_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
