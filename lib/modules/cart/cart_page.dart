import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';
import '../../theme/colors_theme.dart';
import '../../widgets/add_remove_product.dart';
import '../../widgets/delivery_location.dart';
import '../../widgets/empty_view.dart';
import '../../widgets/final_order_amount.dart';
import '../../widgets/payment_method.dart';
import 'cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Cart",
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
            child: Obx(() => cartController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : cartController.cartList.length == 0
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: EmptyView(
                            imagePath: 'assets/images/empty_cart.png',
                            title: "Your cart is empty",
                            description:
                                "Looks like your cart is empty! Take a look at our latest arrivals and add something to your cart"),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Products",
                                style: TextStyle(
                                    color: ThemeColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      color: ThemeColor.grey_300,
                                    );
                                  },
                                  itemCount: cartController.cartList.length,
                                  itemBuilder: (context, index) {
                                    return _cartItem(
                                        cartController.cartList[index]);
                                  }),
                              SizedBox(
                                height: 24,
                              ),
                              FinalOrderAmount(
                                totalAmount: cartController.totalAmount,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              DeliveryLocation(),
                              SizedBox(
                                height: 32,
                              ),
                              PaymentMethod(),
                              SizedBox(
                                height: 44,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                  width: double.infinity,
                                  height: 44,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cartController.placeOrder();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "Place Order",
                                              style: TextStyle(
                                                  color: ThemeColor.white),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          color: ThemeColor.white,
                                        )
                                      ],
                                    ),
                                    style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: ThemeColor.primaryDark,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ))));
  }

  Padding _cartItem(CartModel cartData) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CachedNetworkImage(
            imageUrl: "${cartData.productImageUrl}",
            width: 36,
            height: 36,
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
                  "${cartData.productName}",
                  style: TextStyle(
                      color: ThemeColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text("${cartData.productQuantity}",
                    style: TextStyle(color: ThemeColor.darkGrey, fontSize: 14)),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              Text(
                "₹ ${cartData.price}",
                style: TextStyle(color: ThemeColor.textPrimary, fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              AddRemoveProduct(
                productId: cartData.productId,
                count: cartData.quantityCount,
              )
            ],
          ),
        ]));
  }
}
