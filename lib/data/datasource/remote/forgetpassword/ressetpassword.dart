import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class RessetPasswordData {
  Crud crud;
  RessetPasswordData(this.crud);
  postdata(String email, String password) async {
    var response = await crud.postData(Applink.ressetpassword, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
