import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/product_api.dart';
import '../../models/product_list_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class SearchStoreController extends GetxController {
  final searchProductTxtEdtCtrl = TextEditingController();
  ProductApi productApi = ProductApi();
  var isLoading = false.obs;
  var productList = <ProductListResult>[].obs;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  void getAllProducts() async {
    isLoading.value = true;
    productList.clear();
    final response = await productApi.getAllProducts();
    if (response.code == 200) {
      productList.addAll(response.result);
    } else {
      AppUtils.showSnackBar("Failed to get products",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
