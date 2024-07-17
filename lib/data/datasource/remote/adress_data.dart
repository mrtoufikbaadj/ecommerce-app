import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class AdressData {
  Crud crud;
  AdressData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(Applink.adressview, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(Applink.adressadd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String adressid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(Applink.adressedit, {
      "adressid": adressid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String adressid) async {
    var response =
        await crud.postData(Applink.adressdelete, {"adressid": adressid});
    return response.fold((l) => l, (r) => r);
  }
}
