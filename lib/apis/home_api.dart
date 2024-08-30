import '../models/home_response_model.dart';
import '../utils/dio_client.dart';

class HomeApi {
  Future<HomeResponseModel> getHomeData() async {
    try {
      final response = await DioClient.getDioInstance().get("home");
      return HomeResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }
}
