import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        Applink.favoriteAdd, {"usersid": usersid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        Applink.favoriteRemove, {"usersid": usersid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }
}
