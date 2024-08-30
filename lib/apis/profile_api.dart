import '../models/all_avatar_response_model.dart';
import '../models/update_profile_post_body_model.dart';
import '../models/update_profile_response_model.dart';
import '../models/user_profile_response_model.dart';
import '../utils/dio_client.dart';

class ProfileApi {
  Future<UpdateProfileResponseModel> updateProfile(
      {required UpdateProfilePostBodyModel updateProfilePostBodyModel,
      required int? userId}) async {
    try {
      final response = await DioClient.getDioInstance()
          .put("users/${userId}", data: updateProfilePostBodyModel.toJson());
      return UpdateProfileResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }

  Future<UserProfileResponseModel> getUserProfile(
      {required int? userId}) async {
    try {
      final response = await DioClient.getDioInstance().get("users/${userId}");
      return UserProfileResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }

  Future<AllAvatarResponseModel> getAllAvatars() async {
    try {
      final response = await DioClient.getDioInstance().get("avatars");
      return AllAvatarResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }
}
