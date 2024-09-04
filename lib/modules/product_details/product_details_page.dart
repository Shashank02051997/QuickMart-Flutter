import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/enums/snackbar_status.dart';
import '../../widgets/add_remove_product.dart';
import '../../widgets/product_list.dart';
import '../home/home_controller.dart';
import 'product_details_controller.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsController = Get.find<ProductDetailsController>();
    final homeController = Get.find<HomeController>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: ThemeColor.black,
              )),
          backgroundColor: ThemeColor.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        backgroundColor: ThemeColor.white,
        body: SafeArea(
            child: Obx(
          () => productDetailsController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          imageUrl:
                              "${productDetailsController.productDetailResponse.result?.imageUrl}",
                          height: 200,
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
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _productPrice(productDetailsController),
                            SizedBox(
                              height: 16,
                            ),
                            Divider(
                              color: ThemeColor.grey_300,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Details",
                                style: TextStyle(
                                    color: ThemeColor.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 16,
                            ),
                            Text("Product Description",
                                style: TextStyle(
                                    color: ThemeColor.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${productDetailsController.productDetailResponse.result?.description ?? "--"}",
                                style: TextStyle(
                                  color: ThemeColor.darkGrey,
                                  fontSize: 14,
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              color: ThemeColor.grey_300,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Shelf Life",
                                style: TextStyle(
                                    color: ThemeColor.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${productDetailsController.productDetailResponse.result?.shelfLife ?? "--"} days",
                                style: TextStyle(
                                  color: ThemeColor.darkGrey,
                                  fontSize: 14,
                                )),
                            Divider(
                              color: ThemeColor.grey_300,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Disclaimer",
                                style: TextStyle(
                                    color: ThemeColor.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${productDetailsController.productDetailResponse.result?.disclaimer ?? "--"}",
                                style: TextStyle(
                                  color: ThemeColor.darkGrey,
                                  fontSize: 14,
                                )),
                            Divider(
                              color: ThemeColor.grey_300,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Country of origin",
                                style: TextStyle(
                                    color: ThemeColor.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 8,
                            ),
                            Text("India",
                                style: TextStyle(
                                  color: ThemeColor.darkGrey,
                                  fontSize: 14,
                                )),
                            SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Similar Products",
                                  style: TextStyle(
                                      color: ThemeColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offNamed(AppRoutes.searchStorePage);
                                  },
                                  child: Text(
                                    "See All",
                                    style: TextStyle(
                                        color: ThemeColor.accent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ProductList(
                              product: homeController.allProductList,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        )));
  }

  Column _productPrice(ProductDetailsController productDetailsController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${productDetailsController.productDetailResponse.result?.name}",
                style: TextStyle(
                    color: ThemeColor.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Visibility(
              visible: true,
              child: InkWell(
                onTap: () async {
                  await AppUtils.addItemToCart(CartModel(
                    productId: productDetailsController
                        .productDetailResponse.result?.id,
                    productName: productDetailsController
                        .productDetailResponse.result?.name,
                    productImageUrl: productDetailsController
                        .productDetailResponse.result?.imageUrl,
                    productQuantity: productDetailsController
                        .productDetailResponse.result?.quantity,
                    productPrice: double.tryParse(productDetailsController
                            .productDetailResponse.result?.finalPrice
                            .toString() ??
                        "0"),
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
                  productId:
                      productDetailsController.productDetailResponse.result?.id,
                ))
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
            "${productDetailsController.productDetailResponse.result?.quantity}",
            style: TextStyle(color: ThemeColor.grey, fontSize: 14)),
        SizedBox(
          height: 4,
        ),
        Text(
          "₹ ${productDetailsController.productDetailResponse.result?.discountPrice} Flat Off",
          style: TextStyle(
              color: ThemeColor.red, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
                "₹ ${productDetailsController.productDetailResponse.result?.finalPrice}",
                style: TextStyle(
                    color: ThemeColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: 8,
            ),
            Text(
              "M.R.P: ",
              style: TextStyle(
                color: ThemeColor.grey_500,
                fontSize: 16,
              ),
            ),
            Text(
              "₹ ${productDetailsController.productDetailResponse.result?.actualPrice}",
              style: TextStyle(
                color: ThemeColor.grey_500,
                fontSize: 16,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "(inclusive of all taxes)",
          style: TextStyle(color: ThemeColor.textSecondary, fontSize: 14),
        ),
      ],
    );
  }
}
