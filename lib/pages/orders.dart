import 'package:curbshop_mobile_customer/widgets/pageHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({
    Key key,
  }) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<OrdersPage> {
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
                    icon: FlutterIcons.package_fea,
                    title: 'Orders',
                  )
                ]))));
  }
}
