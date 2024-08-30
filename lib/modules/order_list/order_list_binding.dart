import 'package:get/get.dart';

import 'order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderListController());
  }
}
