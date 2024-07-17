import 'package:get/get.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/adress_data.dart';
import 'package:justappecommerce/data/model/adressmodel.dart';

class AdreeViewController extends GetxController {
  AdressData adressData = AdressData(Get.find());

  MyServices myServices = Get.find();

  List<AdressModel> data = [];
  late StatusRequest statusRequest;

  deleteAdress(String adressid) {
    adressData.deleteData(adressid);
    data.removeWhere((element) => element.adressId.toString() == adressid);
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await adressData.getData(myServices.sharedPreferences.getString('id')!);
    print("====================== controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AdressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
