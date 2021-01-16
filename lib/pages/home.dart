import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.logoutCallback}) : super(key: key);

  final VoidCallback logoutCallback;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return new SafeArea(child: Text("HomePage"));
  }
}
