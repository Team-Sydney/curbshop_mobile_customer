import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/themes/colors.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const SimpleButton({Key key, this.text, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        minWidth: 351.4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.only(top: 14, bottom: 14),
        color: ThemeColors.black,
        onPressed: () => {this.onPress()},
        child: Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w500)));
  }
}
