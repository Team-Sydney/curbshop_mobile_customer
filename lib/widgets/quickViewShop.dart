import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/widgets/quickViewItem.dart';

class QuickViewShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Dave's Dognuts"), Text("Button")])),
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.only(left: 30, right: 25),
                      itemCount: 8,
                      itemBuilder: (context, index) => QuickViewItem())),
            ])));
  }
}
