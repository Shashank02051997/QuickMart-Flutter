import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../../widgets/empty_view.dart';
import 'notifications_controller.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationsController = Get.find<NotificationsController>();
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
            "Notifications",
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
          child: Obx(() => Padding(
                padding: const EdgeInsets.all(16.0),
                child: notificationsController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : notificationsController.notificationList.length == 0
                        ? EmptyView(
                            imagePath: 'assets/images/notifications.png',
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
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return _notificationItem();
                            }),
              )),
        ));
  }

  Padding _notificationItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order #223",
                  style: TextStyle(
                      color: ThemeColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text("Your Order is Confirmed. Please check everthing is okay",
                    style: TextStyle(color: ThemeColor.grey, fontSize: 14))
              ],
            ),
          ),
          SizedBox(
            width: 44,
          ),
          Text(
            "02:39 PM",
            style: TextStyle(color: ThemeColor.darkGrey, fontSize: 10),
          )
        ],
      ),
    );
  }
}
