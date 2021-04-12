import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final String title;
  final int amountInCart;
  final ImageProvider<Object> circleImage;
  final void Function() imageOnPressed;
  final IconData iconButton;
  final void Function() iconOnPressed;

  const Header(
      {Key key,
      @required this.title,
      @required this.amountInCart,
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
          Stack(alignment: AlignmentDirectional.bottomEnd, children: [
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
            // (this.amountInCart > 0 ?

            Positioned(
                bottom: 6,
                right: 6,
                child: AnimatedOpacity(
                    opacity: this.amountInCart > 0 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 250),
                    child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                            color: ThemeColors.primary.normal,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          this.amountInCart.toString(),
                          style: GoogleFonts.poppins(
                              color: ThemeColors.offWhite, fontSize: 12),
                        )))))
            // : Container())
          ]),
        ]));
  }
}
