import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/category_list_response_model.dart';
import '../theme/colors_theme.dart';

class CategoryItemCard extends StatelessWidget {
  final Color color;
  final CategoryListResult category;

  CategoryItemCard({Key? key, required this.category, this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: color.withOpacity(0.7),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: "${category.imageUrl}",
            width: 110,
            height: 110,
            fit: BoxFit.contain,
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
            height: 12,
          ),
          Text(
            "${category.name}",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ThemeColor.black,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
