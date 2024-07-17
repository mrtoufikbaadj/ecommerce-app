import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(Applink.homepage, {});

    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(Applink.searchitems, {'search': search});

    return response.fold((l) => l, (r) => r);
  }
}
