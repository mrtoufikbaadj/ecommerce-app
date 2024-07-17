import 'package:get/get.dart';
import 'package:justappecommerce/core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRout.login);
  }
}
