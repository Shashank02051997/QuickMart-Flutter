import '../models/sign_in_post_body_model.dart';
import '../models/sign_in_response_model.dart';
import '../utils/dio_client.dart';

class SigninApi {
  Future<SignInResponseModel> signIn(
      {required SignInPostBodyModel signInPostBodyModel}) async {
    try {
      final response = await DioClient.getDioInstance()
          .post("auth/user/login", data: signInPostBodyModel.toJson());
      return SignInResponseModel.fromJson(response.data);
    } catch (e) {
      print("Error ==> $e");
      rethrow;
    }
  }
}
