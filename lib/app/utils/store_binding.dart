import 'package:get/get.dart';

import '../ui/controllers/bottom_selection_controller.dart';
import '../ui/controllers/filters_controller.dart';
import '../ui/controllers/home_controller.dart';
import '../ui/controllers/image_controller.dart';
import '../ui/controllers/value_selection_controller.dart';
import '../ui/controllers/value_storage_controller.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomItemSelectionController());
    Get.lazyPut(() => ValueSelectionController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FiltersController());
    Get.lazyPut(() => ValueStorageController());
    Get.lazyPut(() => ImageController());
  }
}
