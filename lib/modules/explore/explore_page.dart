import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/constants.dart';
import '../../widgets/category_item_card.dart';
import '../../widgets/search.dart';
import 'explore_controller.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExploreController exploreController = Get.find<ExploreController>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Find Products",
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
          child: Obx(() => SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: exploreController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            Search(),
                            SizedBox(height: 16),
                            GridView.builder(
                              itemCount: exploreController.categoryList.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.productListPage,
                                        arguments: {
                                          ARG_CATEGORY_ID: exploreController
                                              .categoryList[index].id,
                                          ARG_CATEGORY_NAME: exploreController
                                              .categoryList[index].name
                                        });
                                  },
                                  child: CategoryItemCard(
                                    category:
                                        exploreController.categoryList[index],
                                    color: exploreController.gridColors[index %
                                        exploreController.gridColors.length],
                                  ),
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                              ),
                            ),
                          ],
                        ),
                ),
              )),
        ));
  }
}
