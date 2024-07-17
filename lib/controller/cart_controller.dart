import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/cart_data.dart';
import 'package:justappecommerce/data/model/cartmodel.dart';
import 'package:justappecommerce/data/model/couponmodel.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;

  CartData cartData = CartData(Get.find());

  CouponModel? couponModel;

  int? discountcoupon = 0;

  String? couponname;

  int? couponid;

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  num priceorders = 0;

  num totalcountitems = 0;

  add(String itemsid, String cartitemsprice) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid, cartitemsprice);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("Alert", "Cart is empty !!");
    Get.toNamed(AppRout.checkout, arguments: {
      "couponid": couponid ?? 0,
      "priceorders": priceorders.toDouble(),
      "discountcoupon": discountcoupon
    });
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = dataresponsecountprice['totalcount'];
          priceorders = dataresponsecountprice['totalprice'];
          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = couponModel!.couponDiscount;
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar('Warning', "Coupon not vailde");
      }
      // End
    }
    update();
  }

  getTotalPrice() {
    return priceorders - priceorders * discountcoupon! / 100;
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
