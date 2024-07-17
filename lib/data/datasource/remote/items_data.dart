import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async {
    var response =
        await crud.postData(Applink.itemspage, {"id": id, "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
