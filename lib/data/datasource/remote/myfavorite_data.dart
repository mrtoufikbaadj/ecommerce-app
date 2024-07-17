import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  getData(String id) async {
    var response = await crud.postData(Applink.favoriteView, {"id": id});

    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id) async {
    var response = await crud.postData(Applink.deletefromfavorite, {"id": id});

    return response.fold((l) => l, (r) => r);
  }
}
