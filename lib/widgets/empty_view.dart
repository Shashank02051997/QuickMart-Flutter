import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';

class EmptyView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const EmptyView({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 300,
          ),
          SizedBox(
            height: 44,
          ),
          Text(
            title,
            style: TextStyle(
                color: ThemeColor.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: ThemeColor.grey, fontSize: 14),
          )
        ],
      ),
    );
  }
}
