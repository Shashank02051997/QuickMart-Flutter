import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../widgets/product_list.dart';
import '../../widgets/carousel.dart';
import '../../widgets/search.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "SM Supermart",
            style: TextStyle(
                color: ThemeColor.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/images/notification_icon.svg',
                color: ThemeColor.black,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.notificationPage);
              },
            )
          ],
          backgroundColor: ThemeColor.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        backgroundColor: ThemeColor.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Search(),
                ),
                SizedBox(
                  height: 16,
                ),
                Carousel(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: homeController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exclusive Offer",
                                  style: TextStyle(
                                      color: ThemeColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.productListPage,
                                        arguments: {
                                          ARG_EXCLUSIVE_OFFER_LIST:
                                              homeController.exclusiveOfferList,
                                          ARG_CATEGORY_NAME: "Exclusive Offer"
                                        });
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
                              product: homeController.exclusiveOfferList,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Best Selling",
                                  style: TextStyle(
                                      color: ThemeColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.productListPage,
                                        arguments: {
                                          ARG_BEST_SELLING_LIST:
                                              homeController.bestSellingList,
                                          ARG_CATEGORY_NAME: "Best Selling"
                                        });
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
                              product: homeController.bestSellingList,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Shop by category",
                                  style: TextStyle(
                                      color: ThemeColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: homeController.categoryList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.productListPage,
                                        arguments: {
                                          ARG_CATEGORY_ID: homeController
                                              .categoryList[index].id,
                                          ARG_CATEGORY_NAME: homeController
                                              .categoryList[index].name
                                        });
                                  },
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundColor:
                                        AppUtils.getRandomAvatarBgColor(),
                                    child: ClipOval(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "${homeController.categoryList[index].imageUrl}",
                                          width: double.infinity,
                                          height: double.infinity,
                                          placeholder: (context, url) => Center(
                                            child: Container(
                                              width: 16,
                                              height: 16,
                                              child: CircularProgressIndicator(
                                                color: ThemeColor.accent,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.error,
                                            color: ThemeColor.red,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All Products",
                                  style: TextStyle(
                                      color: ThemeColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.searchStorePage);
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
                ),
              ],
            ),
          ),
        )));
  }
}
