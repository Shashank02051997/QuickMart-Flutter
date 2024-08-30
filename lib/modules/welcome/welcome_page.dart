import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.white,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/welcome_bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to our store",
                    style: TextStyle(
                        color: ThemeColor.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Get your groceries in as fast as on hour",
                    style: TextStyle(color: ThemeColor.grey_200),
                  ),
                  SizedBox(height: 44),
                  SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.signinPage);
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: ThemeColor.white),
                        ),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: ThemeColor.primaryDark,
                        ),
                      )),
                  SizedBox(height: 44),
                ],
              ),
            )
          ],
        ));
  }
}
