import 'package:get/get.dart';

import '../../apis/home_api.dart';
import '../../models/home_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';

class HomeController extends GetxController {
  HomeApi homeApi = HomeApi();
  var isLoading = false.obs;
  var exclusiveOfferList = <AllProduct>[].obs;
  var bestSellingList = <AllProduct>[].obs;
  var categoryList = <Category>[].obs;
  var allProductList = <AllProduct>[].obs;

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }

  void getHomeData() async {
    isLoading.value = true;
    exclusiveOfferList.clear();
    bestSellingList.clear();
    categoryList.clear();
    allProductList.clear();
    final response = await homeApi.getHomeData();
    if (response.code == 200) {
      exclusiveOfferList
          .addAll(response.result?.exclusiveOffers ?? List.empty());
      bestSellingList.addAll(response.result?.bestSellings ?? List.empty());
      categoryList.addAll(response.result?.categories ?? List.empty());
      allProductList.addAll(response.result?.allProducts ?? List.empty());
    } else {
      AppUtils.showSnackBar("Failed to get home data",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
