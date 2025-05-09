import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/iconButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPopupMenuItem {
  final Function onPressed;
  final IconData icon;
  final String label;
  final Color color;

  CustomPopupMenuItem(
      {@required this.onPressed,
      @required this.icon,
      @required this.label,
      this.color});
}

class PopupMenu extends StatelessWidget {
  PopupMenu({
    Key key,
    @required this.imageOnPressed,
    @required this.circleImage,
    @required this.title,
    @required this.showMenu,
    this.menuItems = const [],
  }) : super(key: key);

  final Function imageOnPressed;
  final ImageProvider<Object> circleImage;
  final String title;
  final bool showMenu;
  final List<CustomPopupMenuItem> menuItems;

  @override
  Widget build(BuildContext context) {
    List<Widget> popMenuItems = [];
    popMenuItems.add(Container(
        padding: EdgeInsets.only(right: 14),
        margin: EdgeInsets.only(bottom: 8),
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
                  fontSize: 20,
                  fontWeight: FontWeight.w600))
        ])));
    this.menuItems.forEach((item) {
      popMenuItems.add(Container(
          margin: EdgeInsets.only(top: 2),
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: TextButton(
              onPressed: item.onPressed,
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => (item.color != null
                        ? item.color.withOpacity(0.12)
                        : Theme.of(context).primaryColor.withOpacity(0.12))),
                shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (states) => RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                    (states) => EdgeInsets.only(
                        left: 14, top: 16, right: 14, bottom: 16)),
              ),
              child: Stack(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      item.icon,
                      color:
                          (item.color != null ? item.color : ThemeColors.body),
                    )),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      item.label,
                      style: GoogleFonts.poppins(
                          color: (item.color != null
                              ? item.color
                              : ThemeColors.body),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.75),
                    ))
              ]))));
    });
    return Align(
        alignment: Alignment.topLeft,
        child: AnimatedOpacity(
            opacity: showMenu ? 1.0 : 0.0,
            duration: Duration(milliseconds: 100),
            child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: ((popMenuItems.length * 56.0) +
                        (popMenuItems.length * 2.0)) +
                    30.0,
                margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: popMenuItems,
                    ),
                  ),
                ))));
  }
}
