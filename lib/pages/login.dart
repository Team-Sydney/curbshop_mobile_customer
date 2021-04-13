import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/widgets/appTitle.dart';
import 'package:curbshop_mobile_customer/widgets/iconButton.dart';
import 'package:curbshop_mobile_customer/widgets/loginButtonGroup.dart';
import 'package:curbshop_mobile_customer/widgets/undrawIllustration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {Key key,
      @required this.customPanelController,
      @required this.loginCallback})
      : super(key: key);

  final CustomPanelController customPanelController;
  final Function loginCallback;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
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
    return Container(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTitle(
              title: "curbshop",
              domain: ".online",
            ),
            UndrawIllustration(name: "undraw_shopping", ext: "png"),
            LoginButtonGroup(label: "Sign in with", children: [
              IconSecondaryButton(
                  onPressed: () => widget.loginCallback(),
                  label: "Apple ID",
                  icon: FlutterIcons.apple1_ant),
              IconSecondaryButton(
                  onPressed: () => widget.loginCallback(),
                  label: "Google",
                  icon: FlutterIcons.google_ant)
            ])
          ],
        ));
  }
}
