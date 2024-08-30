import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/category_api.dart';
import '../../models/category_list_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class ExploreController extends GetxController {
  CategoryApi categoryApi = CategoryApi();

  var isLoading = false.obs;
  var categoryList = <CategoryListResult>[].obs;

  List<Color> gridColors = [
    Color(0xff53B175),
    Color(0xffF8A44C),
    Color(0xffF7A593),
    Color(0xffD3B0E0),
    Color(0xffFDE598),
    Color(0xffB7DFF5),
    Color(0xff836AF6),
    Color(0xffD73B77),
  ];

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    isLoading.value = true;
    categoryList.clear();
    final response = await categoryApi.getCategories();
    if (response.code == 200) {
      categoryList.addAll(response.result);
    } else {
      AppUtils.showSnackBar("Failed to get categories",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
