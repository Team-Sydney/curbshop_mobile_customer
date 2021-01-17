import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/models/customerUser.dart';
import 'package:shop_mobile_customer/pages/qrcode.dart';
import 'package:shop_mobile_customer/widgets/carText.dart';
import 'package:shop_mobile_customer/widgets/orderItem.dart';
import 'package:shop_mobile_customer/widgets/simpleButton.dart';
import '../themes/colors.dart';

class Settings extends StatefulWidget {
  Settings({Key key, @required this.logoutCallback, @required this.user})
      : super(key: key);

  final VoidCallback logoutCallback;
  final CustomerUser user;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<Widget> vehicleWidgets = [];
  List<Widget> orderWidgets = [];

  @override
  void initState() {
    super.initState();

    getVehicles();
    getOrders();
  }

  void getVehicles() {
    List<Widget> widgets = [];

    widget.user.vehicles.forEach((v) {
      widgets.add(CarText(
          color: v.color,
          brand: v.brand,
          model: v.model,
          license: v.license,
          vid: v.id));
    });

    widgets.add(CarText());

    if (widgets.length > 2) widgets.removeRange(2, widgets.length);

    setState(() {
      vehicleWidgets = widgets;
    });
  }

  void getOrders() {
    List<Widget> widgets = [];

    widget.user.orders.forEach((o) {
      widgets.add(OrderItem(
        qrCode: o.qrCode,
        oid: o.id,
        onPress: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => QrCodePage(order: o)));
        },
      ));
    });

    setState(() {
      orderWidgets = widgets;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.offWhite,
        body: SafeArea(
            child: Container(
                padding:
                    EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Options",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700)),
                            IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ]),
                      Divider(thickness: 1),
                      Text(
                        "Vehicles",
                        style: TextStyle(fontSize: 16),
                      ),
                      Column(
                          children: vehicleWidgets
                              .where((child) => child != null)
                              .toList()),
                      Divider(thickness: 1),
                      Text(
                        "Orders",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ThemeColors.lightGrey),
                          child: Row(children: [
                            Expanded(
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: orderWidgets
                                        .where((child) => child != null)
                                        .toList()))
                          ])),
                      SimpleButton(
                        text: "Logout",
                        onPress: widget.logoutCallback,
                      )
                    ]))));
  }
}
