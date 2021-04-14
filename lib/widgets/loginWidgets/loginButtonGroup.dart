import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButtonGroup extends StatelessWidget {
  final String label;
  final List<Widget> children;

  const LoginButtonGroup(
      {Key key, @required this.children, @required this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    children.insert(
        0,
        Text(this.label,
            style: GoogleFonts.poppins(
                color: ThemeColors.label, fontWeight: FontWeight.w300)));
    children.insert(
        1,
        Divider(
          indent: 18,
          endIndent: 18,
        ));
    return Container(
        height: 154,
        padding: EdgeInsets.only(left: 24, right: 24),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: this.children,
        ));
  }
}
