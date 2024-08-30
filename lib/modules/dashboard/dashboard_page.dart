import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../cart/cart_page.dart';
import '../explore/explore_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    return Scaffold(
      backgroundColor: ThemeColor.white,
      extendBody: true,
      body: Obx(() => IndexedStack(
            index: dashboardController.selectedTabIndex.value,
            children: [HomePage(), ExplorePage(), CartPage(), ProfilePage()],
          )),
      bottomNavigationBar: Obx(() => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 37,
                      offset: Offset(0, -12)),
                ]),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: ThemeColor.white,
              selectedFontSize: 12,
              selectedIconTheme:
                  IconThemeData(color: ThemeColor.primaryDark, size: 24),
              selectedItemColor: ThemeColor.primaryDark,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedIconTheme:
                  IconThemeData(color: ThemeColor.black, size: 24),
              unselectedItemColor: ThemeColor.black,
              unselectedFontSize: 12,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/shop_icon.svg',
                    color: dashboardController.selectedTabIndex.value == 0
                        ? ThemeColor.primaryDark
                        : ThemeColor.black,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/explore_icon.svg',
                    color: dashboardController.selectedTabIndex.value == 1
                        ? ThemeColor.primaryDark
                        : ThemeColor.black,
                  ),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/cart_icon.svg',
                    color: dashboardController.selectedTabIndex.value == 2
                        ? ThemeColor.primaryDark
                        : ThemeColor.black,
                  ),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/account_icon.svg',
                    color: dashboardController.selectedTabIndex.value == 3
                        ? ThemeColor.primaryDark
                        : ThemeColor.black,
                  ),
                  label: "Profile",
                ),
              ],
              currentIndex: dashboardController.selectedTabIndex.value,
              onTap: dashboardController.onItemTapped,
            ),
          )),
      bottomSheet: Container(
        height: 0,
        color: ThemeColor.white,
      ),
    );
  }
}
