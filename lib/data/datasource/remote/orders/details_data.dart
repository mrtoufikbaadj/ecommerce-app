import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(Applink.ordersdetails, {"id": id});

    return response.fold((l) => l, (r) => r);
  }
}
