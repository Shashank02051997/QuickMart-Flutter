import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashController = Get.find<SplashController>();
    return Scaffold(
        backgroundColor: ThemeColor.white,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/app_logo.png",
                      width: 140,
                      height: 140,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Obx(() => Text(
                        "App version v${splashController.appVersion.value}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ThemeColor.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
