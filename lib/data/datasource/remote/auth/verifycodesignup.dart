import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(Applink.verifycodesignup, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(Applink.resend, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
