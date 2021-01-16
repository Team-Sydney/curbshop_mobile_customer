import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/models/customerUser.dart';
import 'package:shop_mobile_customer/themes/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shop_mobile_customer/widgets/cartItem.dart';
import 'package:shop_mobile_customer/widgets/simpleButton.dart';

class Home extends StatefulWidget {
  Home({Key key, this.logoutCallback, this.user}) : super(key: key);

  final VoidCallback logoutCallback;
  final CustomerUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PanelController panel = new PanelController();

  String buttonText;
  VoidCallback buttonAction;

  void openPanel() {
    panel.open();
  }

  void checkout() {
    print("CHECKOUT");
  }

  @override
  void initState() {
    super.initState();

    buttonText = "0 items in your cart";
    buttonAction = openPanel;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panel,
      onPanelClosed: () => setState(() {
        buttonText = "0 items in your cart";
        buttonAction = openPanel;
      }),
      onPanelOpened: () => setState(() {
        buttonText = "Checkout";
        buttonAction = checkout;
      }),
      backdropEnabled: true,
      backdropOpacity: 0.25,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      minHeight: 100.0,
      maxHeight: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
      footer: Center(
          child: SimpleButton(
        text: buttonText,
        onPress: buttonAction,
      )),
      panel: Container(
          padding: EdgeInsets.only(bottom: 57),
          child: ListView(padding: EdgeInsets.all(0), children: [CartItem()])),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: "curbshop",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ThemeColors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: ".online",
                            style: TextStyle(fontWeight: FontWeight.w400))
                      ]),
                ),
                InkWell(
                    onTap: widget.logoutCallback,
                    child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.user.user.photoUrl)))
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                    color: ThemeColors.lightGrey,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search anything",
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
