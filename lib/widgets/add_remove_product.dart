import 'package:flutter/material.dart';

import '../../theme/colors_theme.dart';
import '../utils/app_utils.dart';

class AddRemoveProduct extends StatelessWidget {
  final int? productId;
  final int? count;
  final VoidCallback? onAddTap;
  final VoidCallback? onRemoveTap;

  const AddRemoveProduct(
      {Key? key,
      required this.productId,
      this.count = 1,
      this.onAddTap,
      this.onRemoveTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final cartController = Get.find<CartController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            await AppUtils.removeItemFromCart(productId);
          },
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                color: ThemeColor.coralRed,
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Icon(
                Icons.remove,
                color: ThemeColor.white,
                size: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          "$count",
          style: TextStyle(
              color: ThemeColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: () async {
            await AppUtils.addItemByProductId(productId);
          },
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                color: ThemeColor.brightGreen,
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Icon(
                Icons.add,
                color: ThemeColor.white,
                size: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
