import 'package:justappecommerce/core/class/crud.dart';
import 'package:justappecommerce/linkapi.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String id) async {
    var response = await crud.postData(Applink.notification, {
      "id": id,
    });

    return response.fold((l) => l, (r) => r);
  }
}
