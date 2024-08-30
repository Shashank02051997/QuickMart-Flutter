import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ThemeColor.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Contact Us",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.black),
          ),
          centerTitle: false,
          backgroundColor: ThemeColor.white,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.grey_50,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ThemeColor.grey_400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  contactUsCard("Delivery Support", "+91 9000800468",
                      "support@smsupermart.in"),
                  SizedBox(
                    height: 12,
                  ),
                  contactUsCard("Service Support", "+91 9000800469",
                      "support@smsupermart.in")
                ],
              ),
            ),
          ),
        ));
  }

  Container contactUsCard(
      String supportName, String supportMobileNumber, String supportEmail) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            supportName,
            style: TextStyle(
              color: ThemeColor.black,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            supportMobileNumber,
            style: TextStyle(color: ThemeColor.darkGrey, fontSize: 14),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            supportEmail,
            style: TextStyle(color: ThemeColor.textPrimary, fontSize: 14),
          )
        ],
      ),
    );
  }
}
