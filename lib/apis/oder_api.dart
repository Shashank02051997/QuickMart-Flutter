import '../models/add_order_items_post_body_model.dart';
import '../models/add_order_items_response_model.dart';
import '../models/add_order_post_body_model.dart';
import '../models/add_order_response_model.dart';
import '../models/order_detail_response_model.dart';
import '../models/order_list_response_model.dart';
import '../utils/dio_client.dart';

class OrderApi {
  Future<AddOrderResponseModel> addOrder(
      {required AddOrderPostBodyModel addOrderPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("orders", data: addOrderPostBodyModel.toJson());
      return AddOrderResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }

  Future<AddOrderItemsResponseModel> addOrderItems(
      {required AddOrderItemsPostBodyModel addOrderItemsPostBodyModel,
      required int? orderId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("orders/$orderId", data: addOrderItemsPostBodyModel.toJson());
      return AddOrderItemsResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }

  Future<OrderListResponseModel> getAllOrders() async {
    try {
      final response = await DioClient.getDioInstance().get("orders");
      return OrderListResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }

  Future<OrderDetailResponseModel> getOrderDetail(
      {required int? orderId}) async {
    try {
      final response =
          await DioClient.getDioInstance().get("orders/$orderId/items");
      return OrderDetailResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }
}
