import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apis/profile_api.dart';
import '../../models/sign_in_response_model.dart';
import '../../models/update_profile_post_body_model.dart';
import '../../models/user_profile_response_model.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';
import '../profile/profile_controller.dart';

class DeliveryAddressController extends GetxController {
  final profileController = Get.find<ProfileController>();
  ProfileApi profileApi = ProfileApi();
  final arguments = Get.arguments;
  final addressTxtEdtCtrl = TextEditingController();

  SignInResponseResult? result;

  var isLoading = false.obs;

  var errorMessage = "";
  var userId = 0;
  late UserProfileResponseModel userProfileResponse;

  @override
  void onInit() {
    if (arguments != null) {
      userProfileResponse = arguments[ARG_PROFILE_DETAIL];
      addressTxtEdtCtrl.text = userProfileResponse.result?.address ?? "";
    }
    result = AppUtils.loginUserDetail().result;
    userId = result?.id ?? 0;
    super.onInit();
  }

  bool _updateAddressFormValidation() {
    if (addressTxtEdtCtrl.text.isEmpty) {
      errorMessage = "Please enter your address";
      return false;
    }
    return true;
  }

  Future<void> updateAddress() async {
    if (_updateAddressFormValidation()) {
      isLoading.value = true;
      final response = await profileApi.updateProfile(
          updateProfilePostBodyModel:
              UpdateProfilePostBodyModel(address: addressTxtEdtCtrl.text),
          userId: userId);
      if (response.code == 200) {
        await profileController.getProfileDetail();
        AppUtils.showSnackBar(response.message ?? "",
            title: "Success", status: MessageStatus.SUCCESS);
      } else {
        AppUtils.showSnackBar("Failed to update address. Please try again",
            status: MessageStatus.ERROR);
      }
      isLoading.value = false;
    } else {
      AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
    }
  }
}
