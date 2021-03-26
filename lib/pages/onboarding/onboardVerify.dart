import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/primaryButton.dart';
import 'package:curbshop_mobile_customer/widgets/secondaryButton.dart';
import 'package:curbshop_mobile_customer/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardVerify extends StatefulWidget {
  const OnboardVerify({Key key, @required this.customPanelController})
      : super(key: key);

  final CustomPanelController customPanelController;

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<OnboardVerify> {
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
            "Verify your\nphone number",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: ThemeColors.title,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                height: 1.1),
          ),
          Text("\nEnter the code we just sent to\n+1 555 555-5555",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: ThemeColors.body,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.75,
              ))
        ]),
        InputField(
          label: "Code",
          icon: Icons.lock,
          inputType: TextInputType.number,
        ),
        SecondaryButton(onPressed: () {}, label: "Resend"),
        PrimaryButton(onPressed: () {}, label: "Continue")
      ],
    );
  }
}
