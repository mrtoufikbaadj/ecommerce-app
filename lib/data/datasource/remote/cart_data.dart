import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String usersid, String itemsid, String cartitemsprice) async {
    var response = await crud.postData(Applink.cartadd, {
      "usersid": usersid,
      "itemsid": itemsid,
      "cartitemsprice": cartitemsprice
    });

    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(Applink.cartdelete, {"usersid": usersid, "itemsid": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  getcountCart(String usersid, String itemsid, String cartitemsprice) async {
    var response = await crud.postData(Applink.cartgetcountitems, {
      "usersid": usersid,
      "itemsid": itemsid,
      "cartitemsprice": cartitemsprice
    });

    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(Applink.cartview, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response = await crud.postData(Applink.checkcoupon, {
      "couponname": couponname,
    });
    return response.fold((l) => l, (r) => r);
  }
}
