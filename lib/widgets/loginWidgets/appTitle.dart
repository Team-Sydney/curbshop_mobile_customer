import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final String domain;

  const AppTitle({Key key, @required this.title, @required this.domain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: RichText(
            text: TextSpan(
                text: this.title,
                style: GoogleFonts.poppins(
                    color: ThemeColors.title,
                    letterSpacing: 1,
                    height: 1,
                    fontSize: 48,
                    fontWeight: FontWeight.w700),
                children: [
              TextSpan(
                text: "\n${this.domain}",
                style: GoogleFonts.poppins(
                    color: ThemeColors.body,
                    letterSpacing: 0.75,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              )
            ])));
  }
}
