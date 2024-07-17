import 'package:get/get.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();

  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  StatusRequest? statusRequest;
  VerifyCodeForgerPasswordData verifyCodeForgerPasswordData =
      VerifyCodeForgerPasswordData(Get.find());
  @override
  checkCode() {}
  @override
  goToResetPassword(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgerPasswordData.postdata(email!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRout.ressetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }
}
