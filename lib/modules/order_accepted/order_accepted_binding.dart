import 'package:get/get.dart';

import 'order_accepted_controller.dart';

class OrderAcceptedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderAcceptedController());
  }
}
