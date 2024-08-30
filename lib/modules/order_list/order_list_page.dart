import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/order_list_response_model.dart';
import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import '../../widgets/empty_view.dart';
import 'order_list_controller.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderListController = Get.find<OrderListController>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              "Orders",
              style: TextStyle(
                  color: ThemeColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              labelColor: ThemeColor.primaryDark,
              unselectedLabelColor: ThemeColor.grey,
              indicatorColor: ThemeColor.primaryDark,
              dividerColor: ThemeColor.grey_200,
              tabs: [
                Tab(
                  text: "Ongoing",
                ),
                Tab(
                  text: "History",
                ),
              ],
            ),
            backgroundColor: ThemeColor.white,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          backgroundColor: ThemeColor.white,
          body: SafeArea(
            child: Obx(() => TabBarView(
                  children: [
                    orderListController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : orderListController.pendingOrderList.length == 0
                            ? EmptyView(
                                imagePath: 'assets/images/empty_order.png',
                                title: "You are up to date!",
                                description:
                                    "You’re all set! No updates at the moment",
                              )
                            : ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    color: ThemeColor.grey_300,
                                  );
                                },
                                itemCount:
                                    orderListController.pendingOrderList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.orderDetailsPage,
                                            arguments: {
                                              ARG_ORDER_ID: orderListController
                                                  .pendingOrderList[index].id
                                            });
                                      },
                                      child: _orderItem(orderListController
                                          .pendingOrderList[index]));
                                }),
                    orderListController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : orderListController.completedOrderList.length == 0
                            ? EmptyView(
                                imagePath: 'assets/images/empty_order.png',
                                title: "You are up to date!",
                                description:
                                    "You’re all set! No updates at the moment",
                              )
                            : ListView.separated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    color: ThemeColor.grey_300,
                                  );
                                },
                                itemCount: orderListController
                                    .completedOrderList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.orderDetailsPage,
                                            arguments: {
                                              ARG_ORDER_ID: orderListController
                                                  .completedOrderList[index].id
                                            });
                                      },
                                      child: _orderItem(orderListController
                                          .completedOrderList[index]));
                                })
                  ],
                )),
          )),
    );
  }

  Padding _orderItem(OrderListResult result) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order #${result.id}",
                  style: TextStyle(
                      color: ThemeColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text("${result.status == "pending" ? "Pending" : "Delivered"}",
                    style: TextStyle(
                        color: result.status == "pending"
                            ? ThemeColor.red
                            : ThemeColor.green,
                        fontSize: 14)),
                SizedBox(
                  height: 4,
                ),
                Text(
                    "${AppUtils.formatDate(result.createdAt ?? "", DISPLAY_DATE_FORMAT_2)}",
                    style: TextStyle(color: ThemeColor.grey, fontSize: 12))
              ],
            ),
          ),
          SizedBox(
            width: 44,
          ),
          Text(
            "₹ ${result.totalAmount}",
            style: TextStyle(
                color: ThemeColor.vividOrange,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
