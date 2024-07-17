import 'package:get/get.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/adress_data.dart';
import 'package:justappecommerce/data/datasource/remote/checkout_data.dart';
import 'package:justappecommerce/data/model/adressmodel.dart';
import 'package:justappecommerce/data/model/cartmodel.dart';
import 'package:justappecommerce/data/model/itemsmodel.dart';
import 'package:justappecommerce/view/screen/checkout.dart';

class CheckoutController extends GetxController {
  AdressData adressData = Get.put(AdressData(Get.find()));

  //CartModel cartModel = Get.put(CartModel());

  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  List<AdressModel> dataAdress = [];

  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;

  String? deliverType;

  int adressId = 0;

  late int couponid;

  late double priceorders;

  late int coupondiscount;

  choosePymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliverType = val;
    update();
  }

  chooseShippingAdress(int val) {
    adressId = val;
    update();
  }

  getShippingAdress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await adressData.getData(myServices.sharedPreferences.getString('id')!);
    print("====================== controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        dataAdress.addAll(listdata.map((e) => AdressModel.fromJson(e)));
        adressId = dataAdress[0].adressId!;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar('Error', "Please select payment method");
    }
    if (deliverType == null) {
      return Get.snackbar('Error', "Please select delivery type");
    }
    if (dataAdress.isEmpty) {
      return Get.snackbar('Error', "Please select Adress or Ad  New Adress");
    }

    statusRequest = StatusRequest.loading;

    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString('id'),
      "adressid": adressId.toString(),
      "orderstype": deliverType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders.toString(),
      "couponid": couponid.toString(),
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
      // "cartitemsprice": cartModel.itemsPrice.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("====================== controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRout.homepage);
        Get.snackbar("Success", "تم الطلب بنجاح");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("خطأ", "الرجاء المحاولة من جديد");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorders'];
    coupondiscount = Get.arguments['discountcoupon'];

    getShippingAdress();
    super.onInit();
  }
}
