import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:intl/intl.dart';

import '../models/cart_model.dart';
import '../models/sign_in_response_model.dart';
import '../modules/cart/cart_controller.dart';
import '../routes/app_routes.dart';
import '../theme/colors_theme.dart';
import 'constants.dart';
import 'enums/snackbar_status.dart';

class AppUtils {
  static void showSnackBar(String message,
      {String title = "Error", MessageStatus status = MessageStatus.NORMAL}) {
    Color backgroundColor;
    switch (status) {
      case MessageStatus.SUCCESS:
        backgroundColor = ThemeColor.green;
        break;
      case MessageStatus.ERROR:
        backgroundColor = ThemeColor.red;
        break;
      case MessageStatus.WARNING:
        backgroundColor = ThemeColor.orange;
        break;
      case MessageStatus.NORMAL:
      default:
        backgroundColor = ThemeColor.black;
        break;
    }

    Get.snackbar(
      title,
      message,
      borderRadius: 4,
      snackPosition: SnackPosition.BOTTOM,
      colorText: ThemeColor.white,
      backgroundColor: backgroundColor,
    );
  }

  static SignInResponseModel loginUserDetail() {
    return SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)));
  }

  static Future<void> addItemToCart(CartModel cart) async {
    try {
      final cartController = Get.find<CartController>();
      // Read the existing cart data
      final cartData = GetStorage().read<List<dynamic>>(KEY_CART_DATA) ?? [];

      List<CartModel> cartItems =
          cartData.map((item) => CartModel.fromJson(item)).toList();
      // Check if the item already exists in the cart
      var existingItemIndex =
          cartItems.indexWhere((item) => item.productId == cart.productId);
      if (existingItemIndex > 0) {
        // If the item already exists, update its quantity
        cartItems[existingItemIndex].quantityCount =
            cartItems[existingItemIndex].quantityCount! + 1;
        cartItems[existingItemIndex].price =
            cartItems[existingItemIndex].quantityCount!.toDouble() *
                cartItems[existingItemIndex].productPrice!.toDouble();
      } else {
        // Otherwise, add the new item to the cart
        cartItems.add(cart);
        existingItemIndex = cartItems.length - 1;
        cartItems[existingItemIndex].quantityCount = 1;
        cartItems[existingItemIndex].price = cart.productPrice?.toDouble();
      }

      // Write the updated cart data to storage
      await GetStorage().write(
          KEY_CART_DATA, cartItems.map((item) => item.toJson()).toList());
      cartController.getCartList();
    } catch (e) {
      print("Error ==> $e");
    }
  }

  static Future<void> removeItemFromCart(int? productId) async {
    try {
      final cartController = Get.find<CartController>();
      // Read the existing cart data
      final cartData = GetStorage().read<List<dynamic>>(KEY_CART_DATA) ?? [];
      List<CartModel> cartItems =
          cartData.map((item) => CartModel.fromJson(item)).toList();

      // Check if the item exists in the cart
      final existingItemIndex =
          cartItems.indexWhere((item) => item.productId == productId);

      if (existingItemIndex >= 0) {
        // If the item exists, reduce its quantity
        if (cartItems[existingItemIndex].quantityCount! > 1) {
          cartItems[existingItemIndex].quantityCount =
              cartItems[existingItemIndex].quantityCount! - 1;
          cartItems[existingItemIndex].price =
              cartItems[existingItemIndex].quantityCount!.toDouble() *
                  cartItems[existingItemIndex].productPrice!.toDouble();
        } else {
          // If the quantity is 1, remove the item from the cart
          cartItems.removeAt(existingItemIndex);
        }
      }

      // Write the updated cart data to storage
      await GetStorage().write(
          KEY_CART_DATA, cartItems.map((item) => item.toJson()).toList());
      cartController.getCartList();
    } catch (e) {
      print("Error ==> $e");
    }
  }

  static Future<void> addItemByProductId(int? productId) async {
    final cartController = Get.find<CartController>();
    // Read the existing cart data
    final cartData = GetStorage().read<List<dynamic>>(KEY_CART_DATA) ?? [];
    List<CartModel> cartItems =
        cartData.map((item) => CartModel.fromJson(item)).toList();

    // Check if the item exists in the cart
    final existingItemIndex =
        cartItems.indexWhere((item) => item.productId == productId);

    if (existingItemIndex >= 0) {
      // If the item exists, increase the quantityCount by 1
      cartItems[existingItemIndex].quantityCount =
          cartItems[existingItemIndex].quantityCount! + 1;
      cartItems[existingItemIndex].price =
          cartItems[existingItemIndex].quantityCount!.toDouble() *
              cartItems[existingItemIndex].productPrice!.toDouble();
      // Write the updated cart data to storage
      await GetStorage().write(
          KEY_CART_DATA, cartItems.map((item) => item.toJson()).toList());
      cartController.getCartList();
    }
  }

  static Future<List<CartModel>> getCartData() async {
    // Read the existing cart data from storage
    final cartData = GetStorage().read<List<dynamic>>(KEY_CART_DATA) ?? [];

    // Convert the list of JSON data to a list of CartModel objects
    List<CartModel> cartItems =
        cartData.map((item) => CartModel.fromJson(item)).toList();

    return cartItems;
  }

  static String getNameInitials(String name) {
    List<String> names = name.split(" ");
    String initials = "";
    int numWords = names.length > 2 ? 2 : names.length;
    for (int i = 0; i < numWords; i++) {
      String initial = names[i][0].toUpperCase();
      initials += initial;
    }
    return initials;
  }

  static Future<Map<String, String>> getAppDetails() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;
    final buildSignature = packageInfo.buildSignature;
    final appName = packageInfo.appName;
    final packageName = packageInfo.packageName;
    final installerStore = packageInfo.installerStore;

    print("App version = $version");
    return {"version": version, "buildNumber": buildNumber};
  }

  static Color getRandomAvatarBgColor() {
    final List<Color> randomColors = [
      Color(0xffC9F2E9),
      Color(0xffC4D0FB),
      Color(0xffBF83FF),
      Color(0xffFFD6DD),
    ];
    final random = Random();
    return randomColors[random.nextInt(randomColors.length)];
  }

  static Color getRandomCardBgColor() {
    final List<Color> randomColors = [
      Color(0xff8891AA),
      Color(0xff88E2CE),
      Color(0xff9087E5),
      Color(0xffF0A2D4),
      Color(0xffF7D37A),
      Color(0xff9DE2B8),
      Color(0xffF5928B),
      Color(0xffA6C1E7),
      Color(0xffFFB478),
      Color(0xffC9A7C1),
      Color(0xff6DD7D3)
    ];
    final random = Random();
    return randomColors[random.nextInt(randomColors.length)];
  }

  static void logout() async {
    await GetStorage().remove(KEY_USER_DATA);
    Get.offAllNamed(AppRoutes.signinPage);
  }

  static String formatDate(String originalDate, String format) {
    // Parse the original date string
    DateTime dateTime = DateTime.parse(originalDate);

    // Format the date to the desired format
    String formattedDate = DateFormat(format).format(dateTime);

    return formattedDate;
  }
}
