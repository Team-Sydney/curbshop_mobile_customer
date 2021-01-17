import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/models/business.dart';
import 'package:shop_mobile_customer/models/product.dart';
import 'package:shop_mobile_customer/pages/productPage.dart';
import 'package:shop_mobile_customer/widgets/quickViewItem.dart';

class QuickViewShop extends StatefulWidget {
  QuickViewShop({Key key, @required this.business, @required this.addToCart})
      : super(key: key);

  final Business business;
  final Function(Product) addToCart;

  @override
  _QuickViewShopState createState() => _QuickViewShopState();
}

class _QuickViewShopState extends State<QuickViewShop> {
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
                      children: [
                        Text(widget.business.name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                        // Text("Button")
                      ])),
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.only(left: 30, right: 25),
                      itemCount: widget.business.products.length,
                      itemBuilder: (context, index) => QuickViewItem(
                            product: widget.business.products[index],
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                          product:
                                              widget.business.products[index],
                                          addToCart: widget.addToCart,
                                        )),
                              );
                            },
                          ))),
            ])));
  }
}
