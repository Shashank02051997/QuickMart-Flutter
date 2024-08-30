import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../apis/oder_api.dart';
import '../../models/add_order_items_post_body_model.dart';
import '../../models/add_order_post_body_model.dart';
import '../../models/cart_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class CartController extends GetxController {
  OrderApi orderApi = OrderApi();
  final localStorage = GetStorage();
  var isLoading = false.obs;
  var cartList = <CartModel>[].obs;

  var totalAmount = 0;

  @override
  void onInit() {
    getCartList();
    super.onInit();
  }

  Future<void> getCartList() async {
    cartList.clear();
    final storedCartData = await AppUtils.getCartData();
    cartList.addAll(storedCartData);
    final amount = cartList.fold(0.0, (sum, item) {
      return sum + (item.price ?? 0);
    });
    totalAmount = amount.floor();
  }

  Future<void> placeOrder() async {
    isLoading.value = true;
    final response = await orderApi.addOrder(
        addOrderPostBodyModel: AddOrderPostBodyModel(totalAmount: totalAmount));
    if (response.code == 200) {
      final orderId = response.result?.id;
      final List<OrderItem> orderItems = [];
      cartList.forEach((element) {
        orderItems.add(OrderItem(
          productId: element.productId,
          quantity: element.quantityCount,
        ));
      });
      await orderApi.addOrderItems(
          addOrderItemsPostBodyModel:
              AddOrderItemsPostBodyModel(orderItems: orderItems),
          orderId: orderId);
      // Remove data from local storage cart data
      await localStorage.remove(KEY_CART_DATA);
      await getCartList();
      isLoading.value = false;
      Get.toNamed(AppRoutes.orderAcceptedPage);
    } else {
      AppUtils.showSnackBar("Failed to place order",
          status: MessageStatus.ERROR);
    }
  }
}
