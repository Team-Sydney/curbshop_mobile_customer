import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/widgets/appTitle.dart';
import 'package:curbshop_mobile_customer/widgets/primaryButton.dart';
import 'package:curbshop_mobile_customer/widgets/loginButtonGroup.dart';
import 'package:curbshop_mobile_customer/widgets/undrawIllustration.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, @required this.customPanelController})
      : super(key: key);

  final CustomPanelController customPanelController;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTitle(
          title: "curbshop",
          domain: ".online",
        ),
        UndrawIllustration(name: "undraw_shopping", ext: "png"),
        LoginButtonGroup(children: [
          PrimaryButton(onPressed: () {}, label: "Sign in with Google")
        ])
      ],
    );
  }
}
