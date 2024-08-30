import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../apis/sign_in_api.dart';
import '../../models/sign_in_post_body_model.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class VerifyOtpController extends GetxController {
  SigninApi signinApi = SigninApi();
  FirebaseAuth auth = FirebaseAuth.instance;
  final localStorage = GetStorage();

  final arguments = Get.arguments;

  final firstOtpDigitController = TextEditingController();
  final secondOtpDigitController = TextEditingController();
  final thirdOtpDigitController = TextEditingController();
  final fourthOtpDigitController = TextEditingController();
  final fifthOtpDigitController = TextEditingController();
  final sixthOtpDigitController = TextEditingController();

  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();
  final thirdFocusNode = FocusNode();
  final fourthFocusNode = FocusNode();
  final fifthFocusNode = FocusNode();
  final sixthFocusNode = FocusNode();

  var isLoading = false.obs;
  var phoneNumber = "".obs;

  var errorMessage = "";
  var receivedID = "";

  @override
  void onInit() {
    if (arguments != null) {
      receivedID = arguments[ARG_VERIFICATION_ID];
      phoneNumber.value = arguments[ARG_PHONE_NUMBER];
    }
    super.onInit();
  }

  bool _verifyOtpFieldValidation() {
    if (firstOtpDigitController.text.isEmpty ||
        secondOtpDigitController.text.isEmpty ||
        thirdOtpDigitController.text.isEmpty ||
        fourthOtpDigitController.text.isEmpty ||
        fifthOtpDigitController.text.isEmpty ||
        sixthOtpDigitController.text.isEmpty) {
      errorMessage = "OTP fields should not be empty";
      return false;
    } else {
      return true;
    }
  }

  void verifyOtp() async {
    if (_verifyOtpFieldValidation()) {
      isLoading.value = true;
      final otp = firstOtpDigitController.text +
          secondOtpDigitController.text +
          thirdOtpDigitController.text +
          fourthOtpDigitController.text +
          fifthOtpDigitController.text +
          sixthOtpDigitController.text;

      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: receivedID,
          smsCode: otp,
        );
        await auth.signInWithCredential(credential).then((value) async {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            final idToken = await user.getIdToken();
            print('Id Token: $idToken Uid: ${user.uid}');
            final response = await signinApi.signIn(
                signInPostBodyModel:
                    SignInPostBodyModel(mobileNumber: phoneNumber.value));
            if (response.code == 200) {
              await localStorage.write(KEY_USER_DATA, response.toJson());
              Get.offAllNamed(AppRoutes.dashboardPage);
            } else {
              AppUtils.showSnackBar("Failed to sign in. Please try again",
                  status: MessageStatus.ERROR);
            }
            isLoading.value = false;
          } else {
            print('User is not signed in');
          }
        });
      } on FirebaseAuthException catch (err) {
        isLoading.value = false;
        print("FirebaseAuthException = $err");
        AppUtils.showSnackBar(
            "The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again",
            status: MessageStatus.ERROR);
      } on FirebaseException catch (err) {
        isLoading.value = false;
        print("FirebaseException = $err");
        AppUtils.showSnackBar("Something went wrong. Please try again",
            status: MessageStatus.ERROR);
      }
    } else {
      AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
    }
  }
}
