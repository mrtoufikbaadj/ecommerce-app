import 'package:get/get.dart';
import 'package:justappecommerce/core/class/statusrequest.dart';
import 'package:justappecommerce/core/constant/routes.dart';
import 'package:justappecommerce/core/functions/handlingdatacontroller.dart';
import 'package:justappecommerce/core/services/services.dart';
import 'package:justappecommerce/data/datasource/remote/orders/archive_data.dart';
import 'package:justappecommerce/data/datasource/remote/orders/pending_data.dart';
import 'package:justappecommerce/data/model/ordersmodel.dart';

class ArchiveOrdersController extends GetxController {
  ArchiveOrdersData archiveOrdersData = ArchiveOrdersData(Get.find());

  MyServices myServices = Get.find();

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;

  String printOrdersType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Drive Thrue";
    }
  }

  printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "order Being Prepared";
    } else if (val == "2") {
      return "ready to picked by delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getArchiveOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveOrdersData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  submitRating(String orderid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveOrdersData.rating(orderid, rating.toString(), comment);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        getArchiveOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrechOrder() {
    getArchiveOrders();
  }

  @override
  void onInit() {
    getArchiveOrders();
    super.onInit();
  }
}
