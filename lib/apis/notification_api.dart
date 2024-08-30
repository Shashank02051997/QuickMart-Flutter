import '../models/notification_response_model.dart';
import '../utils/dio_client.dart';

class NotificationApi {
  Future<NotificationResponseModel> getNotifications() async {
    try {
      final response = await DioClient.getDioInstance().get("notifications");
      return NotificationResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }
}
