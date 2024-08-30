import '../models/product_detail_response_model.dart';
import '../models/product_list_response_model.dart';
import '../utils/dio_client.dart';

class ProductApi {
  Future<ProductListResponseModel> getAllProducts() async {
    try {
      final response = await DioClient.getDioInstance().get("products");
      return ProductListResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }

  Future<ProductDetailResponseModel> getProductDetail(
      {required int? productId}) async {
    try {
      final response =
          await DioClient.getDioInstance().get("products/${productId}");
      return ProductDetailResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }
}
