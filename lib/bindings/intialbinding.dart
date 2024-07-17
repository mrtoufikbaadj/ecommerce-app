import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:justappecommerce/core/class/crud.dart';

class IntialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
