import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../apis/profile_api.dart';
import '../../models/user_profile_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class ProfileController extends GetxController {
  final localStorage = GetStorage();
  ProfileApi profileApi = ProfileApi();

  late UserProfileResponseModel userProfileResponse;

  var isLoading = false.obs;

  @override
  void onInit() {
    getProfileDetail();
    super.onInit();
  }

  Future<void> getProfileDetail() async {
    isLoading.value = true;
    final userId = AppUtils.loginUserDetail().result?.id;
    final response = await profileApi.getUserProfile(userId: userId);
    if (response.code == 200) {
      userProfileResponse = response;
      var loginUserDetail = AppUtils.loginUserDetail();
      loginUserDetail.result?.firstname = userProfileResponse.result?.firstname;
      loginUserDetail.result?.lastname = userProfileResponse.result?.lastname;
      loginUserDetail.result?.email = userProfileResponse.result?.email;
      loginUserDetail.result?.profilePic =
          userProfileResponse.result?.profilePic;
      loginUserDetail.result?.address = userProfileResponse.result?.address;
      await localStorage.write(KEY_USER_DATA, loginUserDetail.toJson());
    } else {
      AppUtils.showSnackBar("Failed to get user profile",
          status: MessageStatus.ERROR);
    }
    isLoading.value = false;
  }
}
