import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class VerifyCodeForgerPasswordData {
  Crud crud;
  VerifyCodeForgerPasswordData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(Applink.verifycodeforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
