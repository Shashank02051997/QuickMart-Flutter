import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../models/home_response_model.dart';
import '../modules/product_details/product_details_controller.dart';
import '../routes/app_routes.dart';
import '../utils/constants.dart';
import 'add_remove_product.dart';

class ProductList extends StatelessWidget {
  final List<AllProduct> product;

  const ProductList({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 12);
          },
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  if (Get.isRegistered<ProductDetailsController>()) {
                    Get.find<ProductDetailsController>().productId =
                        product[index].id ?? 0;
                    Get.find<ProductDetailsController>().getProductDetail();
                  } else {
                    Get.toNamed(AppRoutes.productDetailsPage, arguments: {
                      ARG_PRODUCT_ID: product[index].id,
                    });
                  }
                },
                child: Container(
                  width: 160,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ThemeColor.grey_200)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          imageUrl: "${product[index].imageUrl}",
                          height: 70,
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
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "₹ ${product[index].finalPrice}",
                        style: TextStyle(
                            color: ThemeColor.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹ ${product[index].actualPrice}",
                            style: TextStyle(
                              color: ThemeColor.grey_500,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "₹ ${product[index].discountPrice} Flat Off",
                            style: TextStyle(
                              color: ThemeColor.red,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${product[index].name}",
                        style: TextStyle(
                          color: ThemeColor.textPrimary,
                        ),
                      ),
                      Text(
                        "${product[index].quantity}",
                        style: TextStyle(
                            color: ThemeColor.textSecondary, fontSize: 12),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Spacer(),
                      Divider(
                        color: ThemeColor.grey_300,
                      ),
                      Visibility(
                        visible: true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/cart_icon.svg',
                              color: ThemeColor.lightPrimary,
                              width: 16,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Add to cart",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: false,
                          child: AddRemoveProduct(
                            productId: product[index].id,
                          ))
                    ],
                  ),
                ));
          }),
    );
  }
}
