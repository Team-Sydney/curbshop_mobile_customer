import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/themes/colors.dart';

class QuickViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: 96,
      child: Container(
          margin: EdgeInsets.only(top: 5, right: 5),
          padding: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: ThemeColors.lightGrey,
              borderRadius: BorderRadius.circular(5)),
          child: Image.network(
              "https://assets.stickpng.com/thumbs/584fcc806a5ae41a83ddee8c.png")),
    );
  }
}
