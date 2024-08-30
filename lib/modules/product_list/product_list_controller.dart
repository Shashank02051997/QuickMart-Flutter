import 'package:get/get.dart';

import '../../apis/category_api.dart';
import '../../models/category_product_list_response_model.dart';
import '../../models/home_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class ProductListController extends GetxController {
  CategoryApi categoryApi = CategoryApi();
  final arguments = Get.arguments;

  var isLoading = false.obs;
  var productList = <CategoryProductListResult>[].obs;

  var categoryId = 0;
  var categoryName = "";

  @override
  void onInit() {
    if (arguments != null) {
      categoryId = arguments[ARG_CATEGORY_ID] ?? 0;
      categoryName = arguments[ARG_CATEGORY_NAME] ?? "";
      if (categoryId != 0) {
        getAllProductsOfSpecificCategory();
      } else {
        final exclusiveOfferList =
            arguments[ARG_EXCLUSIVE_OFFER_LIST] as List<AllProduct>?;
        final bestSellingList =
            arguments[ARG_BEST_SELLING_LIST] as List<AllProduct>?;
        if (exclusiveOfferList?.isNotEmpty == true) {
          exclusiveOfferList?.forEach((element) {
            productList.add(CategoryProductListResult(
                id: element.id,
                name: element.name,
                imageUrl: element.imageUrl,
                actualPrice: element.actualPrice,
                discountPrice: element.discountPrice,
                finalPrice: element.finalPrice,
                stock: element.stock,
                description: element.description,
                categoryId: element.categoryId,
                isBestSelling: element.isBestSelling,
                quantity: element.quantity,
                shelfLife: element.shelfLife,
                manufacturer: element.manufacturer,
                disclaimer: element.disclaimer,
                createdAt: element.createdAt,
                updatedAt: element.updatedAt));
          });
        } else if (bestSellingList?.isNotEmpty == true) {
          bestSellingList?.forEach((element) {
            productList.add(CategoryProductListResult(
                id: element.id,
                name: element.name,
                imageUrl: element.imageUrl,
                actualPrice: element.actualPrice,
                discountPrice: element.discountPrice,
                finalPrice: element.finalPrice,
                stock: element.stock,
                description: element.description,
                categoryId: element.categoryId,
                isBestSelling: element.isBestSelling,
                quantity: element.quantity,
                shelfLife: element.shelfLife,
                manufacturer: element.manufacturer,
                disclaimer: element.disclaimer,
                createdAt: element.createdAt,
                updatedAt: element.updatedAt));
          });
        }
      }
    }
    super.onInit();
  }

  Future<void> getAllProductsOfSpecificCategory() async {
    isLoading.value = true;
    productList.clear();
    final response =
        await categoryApi.getAllProductsOfSpecificCategory(catId: categoryId);
    if (response.code == 200) {
      productList.addAll(response.result);
    } else {
      AppUtils.showSnackBar("Failed to get products",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
