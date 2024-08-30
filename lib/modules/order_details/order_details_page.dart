import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/order_detail_response_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../widgets/delivery_location.dart';
import '../../widgets/final_order_amount.dart';
import '../../widgets/payment_method.dart';
import 'order_details_controller.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderDetailsController = Get.find<OrderDetailsController>();
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
            "Order #${orderDetailsController.orderId}",
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
            child: Obx(
          () => orderDetailsController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "#${orderDetailsController.orderDetailResponseModel.result.firstOrNull?.orderId}",
                                      style: TextStyle(
                                          color: ThemeColor.textPrimary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${AppUtils.formatDate(orderDetailsController.orderDetailResponseModel.result.firstOrNull?.createdAt ?? "", DISPLAY_DATE_FORMAT_2)}",
                                      style: TextStyle(
                                        color: ThemeColor.grey,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "${orderDetailsController.orderDetailResponseModel.result.firstOrNull?.status == "pending" ? "Pending" : "Delivered"}",
                                  style: TextStyle(
                                      color: orderDetailsController
                                                  .orderDetailResponseModel
                                                  .result
                                                  .firstOrNull
                                                  ?.status ==
                                              "pending"
                                          ? ThemeColor.red
                                          : ThemeColor.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            DeliveryLocation(
                              isEditableAddress: false,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Divider(
                              color: ThemeColor.grey_300,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text("Items",
                                style: TextStyle(
                                    color: ThemeColor.textPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 12,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: orderDetailsController
                                    .orderDetailResponseModel.result.length,
                                itemBuilder: (context, index) {
                                  return _orderItem(orderDetailsController
                                      .orderDetailResponseModel.result[index]);
                                }),
                            Divider(
                              color: ThemeColor.grey_300,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            FinalOrderAmount(
                              totalAmount: orderDetailsController
                                      .orderDetailResponseModel
                                      .result
                                      .firstOrNull
                                      ?.totalAmount ??
                                  0,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            PaymentMethod(),
                            SizedBox(
                              height: 44,
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoutes.contactUsPage);
                                  },
                                  child: Text(
                                    "Contact with Support",
                                    style: TextStyle(color: ThemeColor.white),
                                  ),
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: ThemeColor.vividOrange,
                                  ),
                                )),
                            /*SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 44,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Cancel Order",
                                    style:
                                        TextStyle(color: ThemeColor.coralRed),
                                  ),
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    side:
                                        BorderSide(color: ThemeColor.coralRed),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                )),*/
                          ])),
                ),
        )));
  }

  Padding _orderItem(OrderDetailResult result) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CachedNetworkImage(
            imageUrl: "${result.imageUrl}",
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
                  "${result.name}",
                  style: TextStyle(
                      color: ThemeColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text("${result.quantity}",
                    style: TextStyle(color: ThemeColor.darkGrey, fontSize: 14)),
                SizedBox(
                  height: 4,
                ),
                Text("Qty: ${result.orderItemQuantityCount}",
                    style: TextStyle(color: ThemeColor.grey, fontSize: 12)),
              ],
            ),
          ),
          Spacer(),
          Text(
            "₹ ${(result.finalPrice ?? 0) * (result.orderItemQuantityCount ?? 0)}",
            style: TextStyle(color: ThemeColor.textPrimary, fontSize: 14),
          ),
        ]));
  }
}
