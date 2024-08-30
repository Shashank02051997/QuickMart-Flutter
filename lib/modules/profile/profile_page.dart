import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../theme/colors_theme.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
            child: Obx(
          () => profileController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppUtils.getRandomAvatarBgColor(),
                            radius: 32,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: AppUtils.loginUserDetail()
                                        .result
                                        ?.profilePic ??
                                    "",
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
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
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppUtils.loginUserDetail().result?.firstname ??
                                    "--",
                                style: TextStyle(
                                    color: ThemeColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                AppUtils.loginUserDetail()
                                        .result
                                        ?.mobileNumber ??
                                    "--",
                                style: TextStyle(
                                  color: ThemeColor.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(
                      color: ThemeColor.grey_300,
                    ),
                    InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.orderListPage);
                        },
                        child: _profileItem(
                            'assets/images/orders_icon.svg', "Orders")),
                    Divider(
                      color: ThemeColor.grey_300,
                    ),
                    InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.editProfilePage, arguments: {
                            ARG_PROFILE_DETAIL:
                                profileController.userProfileResponse,
                          });
                        },
                        child: _profileItem(
                            'assets/images/my_details_icon.svg', "My Details")),
                    Divider(
                      color: ThemeColor.grey_300,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.deliveryAddressPage, arguments: {
                          ARG_PROFILE_DETAIL:
                              profileController.userProfileResponse,
                        });
                      },
                      child: _profileItem(
                          'assets/images/address_icon.svg', "Delivery Address"),
                    ),
                    Divider(
                      color: ThemeColor.grey_300,
                    ),
                    InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.faqsPage);
                        },
                        child: _profileItem(
                            'assets/images/help_icon.svg', "FAQ's")),
                    Divider(
                      color: ThemeColor.grey_300,
                    ),
                    InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.contactUsPage);
                        },
                        child: _profileItem(
                            'assets/images/about_icon.svg', "Contact Us")),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              AppUtils.logout();
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(color: ThemeColor.black),
                            ),
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              textStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: ThemeColor.grey_200,
                            ),
                          )),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
        )));
  }

  Padding _profileItem(String assetName, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(assetName),
              SizedBox(
                width: 16,
              ),
              Text(
                name,
                style: TextStyle(
                    color: ThemeColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
              )
            ],
          ),
        ],
      ),
    );
  }
}
