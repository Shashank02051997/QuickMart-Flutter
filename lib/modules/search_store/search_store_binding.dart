import 'package:get/get.dart';

import 'search_store_controller.dart';

class SearchStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchStoreController());
  }
}
