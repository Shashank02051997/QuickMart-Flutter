import 'package:get/get.dart';

import '../../apis/oder_api.dart';
import '../../models/order_detail_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class OrderDetailsController extends GetxController {
  OrderApi orderApi = OrderApi();
  final arguments = Get.arguments;

  late OrderDetailResponseModel orderDetailResponseModel;

  var isLoading = false.obs;

  var orderId = 0;

  @override
  void onInit() {
    if (arguments != null) {
      orderId = arguments[ARG_ORDER_ID];
      getOrderDetails();
    }
    super.onInit();
  }

  void getOrderDetails() async {
    isLoading.value = true;
    final response = await orderApi.getOrderDetail(orderId: orderId);
    if (response.code == 200) {
      orderDetailResponseModel = response;
    } else {
      AppUtils.showSnackBar("Failed to get order detail",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
