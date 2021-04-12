import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconSecondaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onPressed;

  const IconSecondaryButton(
      {Key key,
      @required this.onPressed,
      @required this.icon,
      @required this.label})
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
        child: Stack(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                this.icon,
                color: ThemeColors.body,
              )),
          Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: GoogleFonts.poppins(
                    color: ThemeColors.body,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.75),
              ))
        ]));
  }
}
