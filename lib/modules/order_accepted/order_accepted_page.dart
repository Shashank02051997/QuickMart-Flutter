import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../widgets/empty_view.dart';

class OrderAcceptedPage extends StatelessWidget {
  const OrderAcceptedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                EmptyView(
                  imagePath: 'assets/images/order_accepted.png',
                  title: "Your order has been accepted",
                  description:
                      "Your items has been placed and is on it's way to being processed",
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAndToNamed(AppRoutes.orderListPage);
                          },
                          child: Text(
                            "Track Order",
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
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text("Back to Home",
                          style: TextStyle(
                            color: ThemeColor.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
