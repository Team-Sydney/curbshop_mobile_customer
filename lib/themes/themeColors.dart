import 'package:flutter/material.dart';

class ThemeColors {
  /// #14142B
  static Color title = Color.fromRGBO(20, 20, 43, 1.0);

  /// #4E4B66
  static Color body = Color.fromRGBO(78, 75, 102, 1.0);

  /// #6E7191
  static Color label = Color.fromRGBO(110, 113, 145, 1.0);

  /// #A0A3BD
  static Color placeholder = Color.fromRGBO(160, 163, 189, 1.0);

  /// #D9DBE9
  static Color line = Color.fromRGBO(217, 219, 233, 1.0);

  /// #EFF0F7
  static Color inputBackground = Color.fromRGBO(239, 240, 246, 1.0);

  /// #F7F7FC
  static Color background = Color.fromRGBO(247, 247, 252, 1.0);

  /// #FCFCFC
  static Color offWhite = Color.fromRGBO(252, 252, 252, 1.0);

  static Primary primary = Primary();
  static Secondary secondary = Secondary();
}

class Primary {
  /// #5F2EEA
  Color normal = Color.fromRGBO(95, 46, 234, 1.0);

  /// #2A00A2
  Color dark = Color.fromRGBO(42, 0, 162, 1.0);

  /// #BCA4FF
  Color darkMode = Color.fromRGBO(188, 164, 255, 1.0);
}

class Secondary {
  /// #1CC8EE
  Color normal = Color.fromRGBO(28, 200, 238, 1.0);

  /// #0096B7
  Color dark = Color.fromRGBO(0, 150, 183, 1.0);

  /// #82E9FF
  Color darkMode = Color.fromRGBO(130, 233, 255, 1.0);
}
