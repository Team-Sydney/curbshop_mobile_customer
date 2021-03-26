import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType inputType;

  const InputField(
      {Key key,
      @required this.label,
      this.icon,
      this.controller,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: this.controller,
          keyboardType: this.inputType,
          style: GoogleFonts.poppins(
              color: ThemeColors.title,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.75),
          cursorColor: ThemeColors.label,
          decoration: InputDecoration(
              labelText: this.label,
              labelStyle: GoogleFonts.poppins(
                  color: ThemeColors.placeholder,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.75),
              prefixIcon: Container(
                  padding:
                      EdgeInsets.only(left: 24, top: 22, right: 24, bottom: 22),
                  child: Icon(
                    this.icon,
                    color: ThemeColors.title,
                  )),
              border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16)),
              filled: true,
              fillColor: ThemeColors.inputBackground,
              floatingLabelBehavior: FloatingLabelBehavior.auto),
        ));
  }
}
