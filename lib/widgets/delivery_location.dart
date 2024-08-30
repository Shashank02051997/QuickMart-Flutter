import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../modules/profile/profile_controller.dart';
import '../routes/app_routes.dart';
import '../utils/app_utils.dart';
import '../utils/constants.dart';

class DeliveryLocation extends StatelessWidget {
  final bool isEditableAddress;

  const DeliveryLocation({
    Key? key,
    this.isEditableAddress = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Delivery Location",
            style: TextStyle(
                color: ThemeColor.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: ThemeColor.lighBlue,
              radius: 20,
              child: Icon(
                Icons.location_on,
                color: ThemeColor.grey,
                size: 16,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text("${AppUtils.loginUserDetail().result?.address}"),
            ),
            Visibility(
              visible: isEditableAddress,
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.deliveryAddressPage, arguments: {
                        ARG_PROFILE_DETAIL:
                            profileController.userProfileResponse,
                      });
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      color: ThemeColor.vividOrange,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
