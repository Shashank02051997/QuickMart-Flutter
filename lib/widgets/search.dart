import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../theme/colors_theme.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.searchStorePage);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: ThemeColor.grey_100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/search_icon.svg',
              color: ThemeColor.grey,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Search Store",
              style: TextStyle(fontSize: 16, color: ThemeColor.grey),
            )
          ],
        ),
      ),
    );
  }
}
