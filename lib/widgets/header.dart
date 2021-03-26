import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String title;
  final ImageProvider<Object> circleImage;
  final void Function() imageOnPressed;
  final IconData iconButton;
  final void Function() iconOnPressed;

  const Header(
      {Key key,
      @required this.title,
      @required this.circleImage,
      @required this.iconButton,
      @required this.iconOnPressed,
      @required this.imageOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: this.imageOnPressed,
              child: Container(
                width: 56,
                height: 56,
                padding: EdgeInsets.all(4),
                child: CircleAvatar(
                    backgroundColor: ThemeColors.background,
                    foregroundImage: this.circleImage),
              )),
          Text(this.title,
              style: GoogleFonts.poppins(
                  color: ThemeColors.title,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1)),
          InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: this.iconOnPressed,
              child: Container(
                  width: 56,
                  height: 56,
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    this.iconButton,
                    size: 32,
                  ))),
        ]));
  }
}
