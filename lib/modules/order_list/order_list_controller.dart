import 'package:get/get.dart';

import '../../apis/oder_api.dart';
import '../../models/order_list_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class OrderListController extends GetxController {
  OrderApi orderApi = OrderApi();

  var isLoading = false.obs;
  final pendingOrderList = <OrderListResult>[].obs;
  final completedOrderList = <OrderListResult>[].obs;

  @override
  void onInit() {
    getAllOngoingOrders();
    super.onInit();
  }

  void getAllOngoingOrders() async {
    isLoading.value = true;
    pendingOrderList.clear();
    completedOrderList.clear();
    final response = await orderApi.getAllOrders();
    if (response.code == 200) {
      pendingOrderList.addAll(
          response.result.where((element) => element.status == "pending"));
      completedOrderList.addAll(
          response.result.where((element) => element.status == "delivered"));
    } else if (response.code == 500) {
      AppUtils.showSnackBar("Failed to get orders",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
