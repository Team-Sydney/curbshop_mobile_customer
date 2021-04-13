import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardWelcome extends StatefulWidget {
  const OnboardWelcome({Key key, @required this.customPanelController})
      : super(key: key);

  final CustomPanelController customPanelController;

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<OnboardWelcome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(children: [
          Text(
            "Welcome to\ncurbshop",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: ThemeColors.title,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                height: 1.1),
          ),
          Text(
              "\nBefore you can shop, we just need a few details to provide a seemless experience.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: ThemeColors.body,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.75,
              ))
        ]),
        PrimaryButton(onPressed: () {}, label: "Continue")
      ],
    );
  }
}
