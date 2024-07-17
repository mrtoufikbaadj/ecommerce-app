import 'package:get/get.dart';

import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/myfavorite_data.dart';
import 'package:justappecommerce/data/model/myfavoritemodel.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData? myfavoriteData = MyFavoriteData(Get.find());

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData!
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));

        print("data");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteFromFavorite(favoriteid) {
    var response = myfavoriteData!.deleteData(favoriteid!.toString());

    data.removeWhere((element) => element.favoriteId == favoriteid);

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
