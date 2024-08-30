import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../utils/enums/snackbar_status.dart';

class SigninController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  final mobileNumberTxtEdtCtrl = TextEditingController();

  var isLoading = false.obs;

  var errorMessage = "";

  bool _sendOtpFormValidation() {
    if (mobileNumberTxtEdtCtrl.text.isEmpty) {
      errorMessage = "Mobile number should not be empty";
      return false;
    } else if (mobileNumberTxtEdtCtrl.text.toString().length != 10) {
      errorMessage = "Enter valid mobile number";
      return false;
    } else {
      return true;
    }
  }

  void sendOtp() async {
    if (_sendOtpFormValidation()) {
      isLoading.value = true;
      auth.verifyPhoneNumber(
        phoneNumber: "+91${mobileNumberTxtEdtCtrl.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then(
            (value) {
              isLoading.value = false;
              Get.offAllNamed(AppRoutes.dashboardPage);
            },
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          isLoading.value = false;
          print("Error: $e");
          AppUtils.showSnackBar("${e.message}", status: MessageStatus.ERROR);
        },
        codeSent: (String verificationId, int? resendToken) {
          isLoading.value = false;
          Get.toNamed(AppRoutes.verifyOtpPage, arguments: {
            ARG_PHONE_NUMBER: mobileNumberTxtEdtCtrl.text,
            ARG_VERIFICATION_ID: verificationId
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          isLoading.value = false;
          //AppUtils.showSnackBar("TimeOut", status: MessageStatus.ERROR);
        },
      );
    } else {
      AppUtils.showSnackBar(errorMessage, status: MessageStatus.ERROR);
    }
  }
}
