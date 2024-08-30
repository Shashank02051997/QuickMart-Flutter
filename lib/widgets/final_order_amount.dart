import 'package:flutter/material.dart';

import '../../theme/colors_theme.dart';

class FinalOrderAmount extends StatelessWidget {
  final int totalAmount;

  FinalOrderAmount({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: TextStyle(color: ThemeColor.grey, fontSize: 16),
            ),
            Text(
              "₹ ${totalAmount}",
              style: TextStyle(color: ThemeColor.grey, fontSize: 16),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Charge",
              style: TextStyle(color: ThemeColor.grey, fontSize: 16),
            ),
            Text(
              "₹ 0",
              style: TextStyle(color: ThemeColor.grey, fontSize: 16),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: TextStyle(
                  color: ThemeColor.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "₹ ${totalAmount}",
              style: TextStyle(
                  color: ThemeColor.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
