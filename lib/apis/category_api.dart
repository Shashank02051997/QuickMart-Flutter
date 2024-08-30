import '../models/category_list_response_model.dart';
import '../models/category_product_list_response_model.dart';
import '../utils/dio_client.dart';

class CategoryApi {
  Future<CategoryListResponseModel> getCategories() async {
    try {
      final response = await DioClient.getDioInstance().get("categories");
      return CategoryListResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }

  Future<CategoryProductListResponseModel> getAllProductsOfSpecificCategory(
      {required int? catId}) async {
    try {
      final response =
          await DioClient.getDioInstance().get("categories/${catId}/products");
      return CategoryProductListResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }
}
