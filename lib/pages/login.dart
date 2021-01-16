import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/auth/auth.dart';
import 'package:shop_mobile_customer/models/customerUser.dart';
import 'package:shop_mobile_customer/widgets/simpleButton.dart';

import '../themes/colors.dart';

class Login extends StatefulWidget {
  Login({Key key, @required this.loginCallback}) : super(key: key);

  final VoidCallback loginCallback;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    return new SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 200),
            child: SizedBox.expand(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "curbshop",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: ThemeColors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                            text: ".online",
                            style: TextStyle(fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: "\nsupport local businesses",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400))
                      ]),
                ),
                SimpleButton(
                  text: "Continue",
                  onPress: widget.loginCallback,
                )
              ],
            ))));
  }
}
