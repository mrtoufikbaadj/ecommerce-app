import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class ArchiveOrdersData {
  Crud crud;

  ArchiveOrdersData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(Applink.ordersarchive, {
      "id": userid,
    });

    return response.fold((l) => l, (r) => r);
  }

  rating(String id, String rating, String comment) async {
    var response = await crud.postData(Applink.rating, {
      "id": id,
      "rating": rating,
      "comment": comment,
    });

    return response.fold((l) => l, (r) => r);
  }
}
