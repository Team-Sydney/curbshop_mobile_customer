import 'package:flutter/material.dart';

class LoginButtonGroup extends StatelessWidget {
  final List<Widget> children;

  const LoginButtonGroup({Key key, @required this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: this.children,
        ));
  }
}
