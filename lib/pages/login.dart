import 'package:flutter/material.dart';

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
    return new SafeArea(child: Text("LoginPage"));
  }
}
