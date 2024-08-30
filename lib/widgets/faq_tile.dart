import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';

class FAQTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String content;

  FAQTile({
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: ThemeColor.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                  fontSize: 16,
                  color:
                      _isExpanded ? ThemeColor.black : ThemeColor.textPrimary),
            ),
            subtitle: _isExpanded
                ? null
                : Text(
                    widget.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: ThemeColor.darkGrey),
                  ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            trailing: Icon(
              _isExpanded
                  ? Icons.expand_less_rounded
                  : Icons.expand_circle_down_rounded,
              size: 32,
              color: ThemeColor.grey,
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subtitle,
                    style: TextStyle(fontSize: 14, color: ThemeColor.darkGrey),
                  ),
                  Text(widget.content,
                      style: TextStyle(fontSize: 14, color: ThemeColor.grey)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
