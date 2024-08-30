import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../../widgets/faq_tile.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({Key? key}) : super(key: key);

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
            "FAQ's",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColor.black,
            ),
          ),
          centerTitle: false,
          backgroundColor: ThemeColor.white,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.grey_50,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FAQTile(
                  title: "Who can use our services?",
                  subtitle: 'Eligibility Requirements',
                  content:
                      "To use our services, you must be at least 18 years old and provide a valid address within our delivery areas.",
                ),
                FAQTile(
                  title: 'Is there a minimum order requirement?',
                  subtitle: 'Minimum Order Value',
                  content:
                      'Yes, a minimum order value of ₹200 is required for delivery.',
                ),
                FAQTile(
                  title: 'What are the delivery hours?',
                  subtitle: 'Delivery Time Limits',
                  content:
                      'Our delivery services are available from 6 AM to 11 PM. Orders placed outside of these hours will be processed the next day.',
                ),
                FAQTile(
                  title: 'Can I track my order?',
                  subtitle: 'Order Tracking',
                  content:
                      'Yes, you can track your order in real-time through our app from the moment it is confirmed until it is delivered.',
                ),
                FAQTile(
                  title: 'What is the return policy?',
                  subtitle: 'Returns and Refunds',
                  content:
                      'We offer a hassle-free return policy within 7 days of delivery for eligible items. Refunds will be processed to the original payment method.',
                ),
              ],
            ),
          ),
        ));
  }
}
