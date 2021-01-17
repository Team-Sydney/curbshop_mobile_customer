import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/models/product.dart';
import 'package:shop_mobile_customer/themes/colors.dart';

class QuickViewItem extends StatelessWidget {
  final Product product;
  final VoidCallback onPress;

  const QuickViewItem({Key key, @required this.product, @required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: SizedBox(
          height: 96,
          width: 96,
          child: Container(
              margin: EdgeInsets.only(top: 5, right: 5),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: ThemeColors.lightGrey,
                  borderRadius: BorderRadius.circular(5)),
              child: Image.network(
                product.photoURL,
                fit: BoxFit.cover,
              )),
        ));
  }
}
