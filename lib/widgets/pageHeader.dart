import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const PageHeader({Key key, @required this.title, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Stack(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
          Align(
              alignment: Alignment.center,
              child: Container(
                  width: 150,
                  child: Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      direction: Axis.horizontal,
                      children: [
                        Icon(this.icon),
                        Text(
                          this.title,
                          style: GoogleFonts.poppins(
                              color: ThemeColors.title,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        )
                      ])))
        ]));
  }
}
