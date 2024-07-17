import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class OffersData {
  Crud crud;

  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(Applink.offers, {});

    return response.fold((l) => l, (r) => r);
  }
}
