import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(Applink.checkemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
