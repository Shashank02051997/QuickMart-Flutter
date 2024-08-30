import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_list_response_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/constants.dart';
import '../../widgets/product_item.dart';
import 'product_list_controller.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productListController = Get.find<ProductListController>();
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
          centerTitle: false,
          title: Text(
            "${productListController.categoryName}",
            style: TextStyle(
                color: ThemeColor.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: ThemeColor.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Obx(() => productListController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: ThemeColor.grey_200,
                        );
                      },
                      itemCount: productListController.productList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.productDetailsPage,
                                  arguments: {
                                    ARG_PRODUCT_ID: productListController
                                        .productList[index].id,
                                  });
                            },
                            child: ProductItem(
                                product: ProductListResult(
                                    id: productListController
                                        .productList[index].id,
                                    name: productListController
                                        .productList[index].name,
                                    description: productListController
                                        .productList[index].description,
                                    quantity: productListController
                                        .productList[index].quantity,
                                    shelfLife: productListController
                                        .productList[index].shelfLife,
                                    manufacturer: productListController
                                        .productList[index].manufacturer,
                                    disclaimer: productListController
                                        .productList[index].disclaimer,
                                    actualPrice: productListController
                                        .productList[index].actualPrice,
                                    discountPrice: productListController
                                        .productList[index].discountPrice,
                                    finalPrice: productListController
                                        .productList[index].finalPrice,
                                    stock: productListController
                                        .productList[index].stock,
                                    imageUrl: productListController
                                        .productList[index].imageUrl,
                                    categoryId: productListController
                                        .productList[index].categoryId,
                                    isBestSelling: productListController
                                            .productList[index].isBestSelling ==
                                        1,
                                    createdAt: productListController
                                        .productList[index].createdAt,
                                    updatedAt: productListController
                                        .productList[index].updatedAt)));
                      }),
                )),
        ));
  }
}
