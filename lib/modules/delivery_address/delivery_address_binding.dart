import 'package:get/get.dart';

import 'delivery_address_controller.dart';

class DeliveryAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeliveryAddressController());
  }
}
