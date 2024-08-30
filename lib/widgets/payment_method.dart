import 'package:flutter/material.dart';

import '../../theme/colors_theme.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment Method",
            style: TextStyle(
                color: ThemeColor.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: ThemeColor.greenishBlue,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: ThemeColor.accent,
                radius: 20,
                child: Icon(
                  Icons.currency_rupee_sharp,
                  color: ThemeColor.white,
                  size: 16,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cash on Delivery",
                      style: TextStyle(
                          color: ThemeColor.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Pay for your order when it arrives at your doorstep",
                      style: TextStyle(
                          color: ThemeColor.textSecondary, fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
