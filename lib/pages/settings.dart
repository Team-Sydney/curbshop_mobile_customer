import 'package:curbshop_mobile_customer/widgets/pageHeader.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key key,
  }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
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
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 8),
                child: Column(children: [
                  PageHeader(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                  )
                ]))));
  }
}
