import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:justappecommerce/controller/home_controller.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/items_data.dart';
import 'package:justappecommerce/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  String? catid;
  int? selectedCat;

  ItemsData itemsData = ItemsData(Get.find());

  int? deliveryTime;

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();

    intialData();
    super.onInit();
  }

  intialData() {
    deliveryTime = myServices.sharedPreferences.getInt("deliveryTime");
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  changeCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryid, myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}


























// class FavoriteController extends GetxController {
//   Map isFavorite = {};

//   setFavorite(id, val) {
//     isFavorite[id] = val;
//     print(isFavorite[id]);
//     update();
//   }
// }




// import 'package:get/get.dart';
// import 'package:justappecommerce/core/class/statusrequest.dart';
// import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
// import 'package:justappecommerce/core/services/services.dart';
// import 'package:justappecommerce/data/datasource/remote/items_data.dart';
// import 'package:justappecommerce/data/model/itemsmodel.dart';

// abstract class ItemsController extends GetxController {
//   initialData();
//   changeCat(int val, String catVal);
//   getItems(String categoryid);
//   goToPageProductDetails(ItemsModel itemsModel);
// }

// class ItemsControllerImp extends ItemsController {
//   List categories = [];
//   int? selectedCat;
//   String? catid;

//   ItemsData testData = ItemsData(Get.find());

//   List data = [];
//   late StatusRequest statusRequest;

//   MyServices myServices = Get.find();

//   @override
//   void onInit() {
//     super.onInit();
//     initialData();
//   }

//   @override
//   initialData() {
//     categories = Get.arguments['categories'];
//     selectedCat = Get.arguments['selectedCat'];
//     catid = Get.arguments['catid'];
//     getItems(catid!);
//   }

//   @override
//   changeCat(val, catVal) {
//     selectedCat = val;
//     catid = catVal;
//     update();
//     getItems(catid!);
//   }

//   @override
//   getItems(categoryid) async {
//     data.clear();
//     statusRequest = StatusRequest.loading;
//     var response = await testData.getData(
//         categoryid, myServices.sharedPreferences.getString("id")!);
//     print("====================== controller $response");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == 'success') {
//         data.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   goToPageProductDetails(itemsModel) {
//     Get.toNamed("productdetails", arguments: {
//       "itemsModel": itemsModel,
//     });
//   }
// }
