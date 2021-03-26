import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/primaryButton.dart';
import 'package:curbshop_mobile_customer/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardVehicle extends StatefulWidget {
  const OnboardVehicle({Key key, @required this.customPanelController})
      : super(key: key);

  final CustomPanelController customPanelController;

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<OnboardVehicle> {
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
            "Add your\nvehicle",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: ThemeColors.title,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                height: 1.1),
          ),
          Text(
              "\nHelp associates easily identify you for a quick & painless pickup.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: ThemeColors.body,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.75,
              ))
        ]),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InputField(
            label: "Color, Make & Model",
            icon: Icons.car_rental,
          ),
          InputField(
            label: "License Plate",
            icon: Icons.perm_identity,
            inputType: TextInputType.text,
          ),
        ]),
        PrimaryButton(onPressed: () {}, label: "Continue")
      ],
    );
  }
}
