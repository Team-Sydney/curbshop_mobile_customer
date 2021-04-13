import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/primaryButton.dart';
import 'package:curbshop_mobile_customer/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardNumber extends StatefulWidget {
  const OnboardNumber({Key key, @required this.customPanelController})
      : super(key: key);

  final CustomPanelController customPanelController;

  @override
  _NumberState createState() => _NumberState();
}

class _NumberState extends State<OnboardNumber> {
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
            "Add your\nphone number",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: ThemeColors.title,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                height: 1.1),
          ),
          Text(
              "\nWe will never share your number or use it for purposes outside curbshop.online",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: ThemeColors.body,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.75,
              ))
        ]),
        InputField(
          label: "Phone Number",
          icon: Icons.phone,
          inputType: TextInputType.phone,
        ),
        PrimaryButton(onPressed: () {}, label: "Continue")
      ],
    );
  }
}
