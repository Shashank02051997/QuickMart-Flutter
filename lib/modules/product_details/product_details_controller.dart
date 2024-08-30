import 'package:get/get.dart';

import '../../apis/product_api.dart';
import '../../models/product_detail_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class ProductDetailsController extends GetxController {
  ProductApi productApi = ProductApi();
  final arguments = Get.arguments;

  var isLoading = false.obs;

  var productId = 0;
  late ProductDetailResponseModel productDetailResponse;

  @override
  void onInit() {
    if (arguments != null) {
      productId = arguments[ARG_PRODUCT_ID];
      getProductDetail();
    }
    super.onInit();
  }

  void getProductDetail() async {
    isLoading.value = true;
    final response = await productApi.getProductDetail(productId: productId);
    if (response.code == 200) {
      productDetailResponse = response;
    } else {
      AppUtils.showSnackBar("Failed to get product detail",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
