import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/profile_api.dart';
import '../../models/all_avatar_response_model.dart';
import '../../models/sign_in_response_model.dart';
import '../../models/update_profile_post_body_model.dart';
import '../../models/user_profile_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';
import '../profile/profile_controller.dart';

class EditProfileController extends GetxController {
  final profileController = Get.find<ProfileController>();
  ProfileApi profileApi = ProfileApi();
  final arguments = Get.arguments;
  final GlobalKey<FormState> editProfileFormKey =
      GlobalKey<FormState>(debugLabel: '__editProfileFormKey__');

  final firstNameTxtEdtCtrl = TextEditingController();
  final lastNameTxtEdtCtrl = TextEditingController();
  final emailTxtEdtCtrl = TextEditingController();
  final mobileTxtEdtCtrl = TextEditingController();

  SignInResponseResult? result;

  var isLoading = false.obs;
  var profilePicUrl = "".obs;

  var errorMessage = "";
  var userId = 0;
  var allAvatars = <AllAvatarResult>[];
  late UserProfileResponseModel userProfileResponse;

  @override
  void onInit() {
    if (arguments != null) {
      userProfileResponse = arguments[ARG_PROFILE_DETAIL];
      profilePicUrl.value = userProfileResponse.result?.profilePic ?? "";
      firstNameTxtEdtCtrl.text = userProfileResponse.result?.firstname ?? "";
      lastNameTxtEdtCtrl.text = userProfileResponse.result?.lastname ?? "";
      emailTxtEdtCtrl.text = userProfileResponse.result?.email ?? "";
      mobileTxtEdtCtrl.text = userProfileResponse.result?.mobileNumber ?? "";
    }
    result = AppUtils.loginUserDetail().result;
    userId = result?.id ?? 0;
    super.onInit();
  }

  bool _updateProfileFormValidation() {
    // Regular expression for validating an email address
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);

    if (emailTxtEdtCtrl.text.isEmpty ||
        !regExp.hasMatch(emailTxtEdtCtrl.text)) {
      errorMessage = "Please enter a valid email address";
      return false;
    } else {
      return true;
    }
  }

  void updateProfile() async {
    if (_updateProfileFormValidation()) {
      isLoading.value = true;
      final response = await profileApi.updateProfile(
          updateProfilePostBodyModel: UpdateProfilePostBodyModel(
              firstname: firstNameTxtEdtCtrl.text,
              lastname: lastNameTxtEdtCtrl.text,
              email: emailTxtEdtCtrl.text,
              profilePic: profilePicUrl.value),
          userId: userId);
      if (response.code == 200) {
        await profileController.getProfileDetail();
        AppUtils.showSnackBar(response.message ?? "",
            title: "Success", status: MessageStatus.SUCCESS);
      } else {
        AppUtils.showSnackBar("Failed to update profile. Please try again",
            status: MessageStatus.ERROR);
      }
      isLoading.value = false;
    } else {
      AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
    }
  }

  Future<void> getAllAvatars() async {
    if (allAvatars.length == 0) {
      final response = await profileApi.getAllAvatars();
      if (response.code == 200) {
        allAvatars.addAll(response.result);
      } else {
        AppUtils.showSnackBar("Error", status: MessageStatus.ERROR);
      }
    }
  }
}
