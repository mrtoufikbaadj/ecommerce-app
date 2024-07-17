import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isFavorite = {};

//  key => id items
//  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text(
              "تم اضافة المنتج من المفضلة ",
              style: TextStyle(color: Colors.white),
            ));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضلة ",
                style: TextStyle(color: Colors.white)));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:justappecommerce/core/class/statusrequest.dart';
// import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
// import 'package:justappecommerce/core/services/services.dart';
// import 'package:justappecommerce/data/datasource/remote/favorite_data.dart';

// class FavoriteController extends GetxController {
//   FavoriteData favoriteData = FavoriteData(Get.find());

//   List data = [];
//   late StatusRequest statusRequest;

//   MyServices myServices = Get.find();

//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     update();
//   }

//   addFavorite(String itemsid) async {
//     data.clear();
//     statusRequest = StatusRequest.loading;
//     var response = await favoriteData.addFavorite(
//         myServices.sharedPreferences.getString('id')!, itemsid);
//     print("====================== controller $response");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == 'success') {
//         Get.rawSnackbar(
//             title: "Alert !!",
//             messageText: const Text("items Added to favorite successful"));

//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//   }

//   removeFavorite(String itemsid) async {
//     data.clear();
//     statusRequest = StatusRequest.loading;
//     var response = await favoriteData.removeFavorite(
//         myServices.sharedPreferences.getString('id')!, itemsid);
//     print("====================== controller $response");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == 'success') {
//         Get.rawSnackbar(
//             title: "Alert !!",
//             messageText: const Text("items Deleted successful from favorite"));
//         // data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//   }
// }


