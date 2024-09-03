import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/constants.dart';
import '../../widgets/product_item.dart';
import 'search_store_controller.dart';

class SearchStorePage extends StatelessWidget {
  const SearchStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchStoreController = Get.find<SearchStoreController>();
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
          () => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: searchStoreController.searchProductTxtEdtCtrl,
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: ThemeColor.black, fontSize: 14),
                  onChanged: (value) {
                    searchStoreController.searchProducts(value);
                  },
                  decoration: InputDecoration(
                    counterText: '',
                    prefixIcon:
                        Icon(Icons.search_outlined, color: ThemeColor.grey),
                    contentPadding: EdgeInsets.all(12),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: "Search Store",
                    hintStyle:
                        TextStyle(fontSize: 14, color: ThemeColor.grey_600),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: ThemeColor.grey_100,
                  ),
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
                Expanded(
                    child: searchStoreController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                color: ThemeColor.grey_300,
                              );
                            },
                            itemCount:
                                searchStoreController.searchProductList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.productDetailsPage,
                                        arguments: {
                                          ARG_PRODUCT_ID: searchStoreController
                                              .searchProductList[index].id,
                                        });
                                    searchStoreController
                                        .searchProductTxtEdtCtrl.text = "";
                                    searchStoreController.searchProducts("");
                                  },
                                  child: ProductItem(
                                    product: searchStoreController
                                        .searchProductList[index],
                                  ));
                            })),
              ],
            ),
          ),
        )));
  }
}
