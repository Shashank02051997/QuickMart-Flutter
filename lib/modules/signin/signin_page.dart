import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'signin_controller.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signinController = Get.find<SigninController>();
    return Scaffold(
        backgroundColor: ThemeColor.white,
        body: Obx(() => signinController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login_bg.png",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back!",
                            style: TextStyle(
                                color: ThemeColor.black, fontSize: 24),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Get your groceries with SM Supermart",
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: signinController.mobileNumberTxtEdtCtrl,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                                color: ThemeColor.black, fontSize: 14),
                            maxLength: 10,
                            decoration: InputDecoration(
                              counterText: '',
                              prefixIcon: Icon(
                                Icons.phone_outlined,
                                size: 18,
                              ),
                              contentPadding: EdgeInsets.all(12),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: ThemeColor.grey_600),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: ThemeColor.grey_100,
                            ),
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(height: 24),
                          SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () {
                                  signinController.sendOtp();
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: ThemeColor.white),
                                ),
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: ThemeColor.primaryDark,
                                ),
                              )),
                          SizedBox(
                            height: 44,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "By continuing, you agree to the ",
                                      style: TextStyle(
                                        color: ThemeColor.grey,
                                      ),
                                    ),
                                    TextSpan(
                                        text:
                                            "Terms of service & Privacy Policy",
                                        style: TextStyle(
                                            color: ThemeColor.black,
                                            fontWeight: FontWeight.bold)),
                                  ]))
                        ],
                      ),
                    )
                  ],
                ),
              )));
  }
}
