import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const SecondaryButton(
      {Key key, @required this.onPressed, @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (states) =>
                  EdgeInsets.only(left: 22, top: 16, right: 22, bottom: 16)),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
              color: ThemeColors.body,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.75),
        ));
  }
}
