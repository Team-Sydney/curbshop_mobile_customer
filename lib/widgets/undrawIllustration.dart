import 'package:flutter/material.dart';

class UndrawIllustration extends StatelessWidget {
  final String name;
  final String ext;

  const UndrawIllustration({Key key, @required this.name, @required this.ext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Image.asset("assets/illustrations/${this.name}.${this.ext}"),
    );
  }
}
