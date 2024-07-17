import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(Applink.pendingorders, {
      "id": usersid,
    });

    return response.fold((l) => l, (r) => r);
  }

  deleteData(String orderid) async {
    var response = await crud.postData(Applink.orderdelete, {
      "id": orderid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
