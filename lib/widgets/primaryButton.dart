import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const PrimaryButton({Key key, @required this.onPressed, @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (states) =>
                    EdgeInsets.only(left: 51, top: 19, right: 51, bottom: 19)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) => ThemeColors.title)),
        child: Text(
          label,
          style: GoogleFonts.poppins(
              color: ThemeColors.offWhite,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.75),
        ));
  }
}
