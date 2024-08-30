import 'package:get/get.dart';

import '../explore/explore_controller.dart';
import '../cart/cart_controller.dart';
import '../home/home_controller.dart';
import '../profile/profile_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ExploreController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProfileController());
  }
}
