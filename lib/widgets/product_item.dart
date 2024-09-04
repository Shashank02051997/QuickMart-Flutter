import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../theme/colors_theme.dart';
import '../models/cart_model.dart';
import '../models/product_list_response_model.dart';
import '../utils/app_utils.dart';
import '../utils/enums/snackbar_status.dart';
import 'add_remove_product.dart';

class ProductItem extends StatelessWidget {
  final ProductListResult product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: "${product.imageUrl}",
            width: 44,
            height: 44,
            placeholder: (context, url) => Center(
              child: Container(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: ThemeColor.accent,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: ThemeColor.red,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.name}",
                  style: TextStyle(
                      color: ThemeColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text("${product.quantity}",
                    style: TextStyle(color: ThemeColor.grey, fontSize: 14)),
                SizedBox(
                  height: 4,
                ),
                Visibility(
                  visible: product.discountPrice != 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹ ${product.actualPrice}",
                        style: TextStyle(
                          color: ThemeColor.grey_500,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "₹ ${product.discountPrice} Flat Off",
                        style: TextStyle(
                          color: ThemeColor.red,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Text("₹ ${product.finalPrice}",
                    style: TextStyle(
                        color: ThemeColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Visibility(
            visible: true,
            child: InkWell(
              onTap: () async {
                await AppUtils.addItemToCart(CartModel(
                  productId: product.id,
                  productName: product.name,
                  productImageUrl: product.imageUrl,
                  productQuantity: product.quantity,
                  productPrice: double.tryParse(product.finalPrice.toString()),
                ));
                AppUtils.showSnackBar("Added to cart",
                    title: "Success", status: MessageStatus.SUCCESS);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: ThemeColor.accent,
                    ),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  "+ ADD",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.accent),
                ),
              ),
            ),
          ),
          Visibility(
              visible: false,
              child: AddRemoveProduct(
                productId: product.id,
              ))
        ],
      ),
    );
  }
}
