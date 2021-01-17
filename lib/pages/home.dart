import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/models/business.dart';
import 'package:shop_mobile_customer/models/customerUser.dart';
import 'package:shop_mobile_customer/models/order.dart';
import 'package:shop_mobile_customer/models/product.dart';
import 'package:shop_mobile_customer/pages/settings.dart';
import 'package:shop_mobile_customer/themes/colors.dart';
import 'package:shop_mobile_customer/widgets/quickViewShop.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shop_mobile_customer/widgets/cartItem.dart';
import 'package:shop_mobile_customer/widgets/simpleButton.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  Home({Key key, this.logoutCallback, this.user}) : super(key: key);

  final VoidCallback logoutCallback;
  final CustomerUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PanelController panel = new PanelController();
  List<Product> inCart = [];

  List<Business> businesses = [];

  String buttonText;
  VoidCallback buttonAction;

  void openPanel() {
    panel.open();
  }

  Future<void> checkout() async {
    String url = 'https://api.curbshop.online/api/orders';
    var res = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, String>{
          "cid": "${widget.user.id}",
          "bid": "625262931531497474",
          "qrCode": '${widget.user.id}${widget.user.user.uid}'
        }));
    if (res.statusCode == 200) {
      var json = convert.jsonDecode(res.body);
      // Add Order Stuff Here
      widget.user.orders.add(new Order(int.parse(json['oid']),
          '${widget.user.id}${widget.user.user.uid}', DateTime.now()));
      setState(() {
        inCart = [];
      });
    } else {
      print(res.statusCode);
      print(res.body);
    }
  }

  void addToCart(Product product) {
    List<Product> tmpCart = inCart;
    tmpCart.add(product);
    setState(() {
      buttonText = '${inCart.length} items in your cart';
      inCart = tmpCart;
    });
  }

  void removeFromCart(Product product) {
    List<Product> tmpCart = inCart;
    tmpCart.remove(product);
    setState(() {
      inCart = tmpCart;
    });
  }

  @override
  void initState() {
    super.initState();

    buttonText = "0 items in your cart";
    buttonAction = openPanel;

    getShops().then((bs) => {
          setState(() {
            this.businesses = bs;
          })
        });
  }

  Future<List<Business>> getShops() async {
    List<Business> businesses = [];
    String url = "https://api.curbshop.online/api/businesses";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> businessesJson = convert.jsonDecode(response.body);
      for (dynamic b in businessesJson) {
        String prodUrl =
            'https://api.curbshop.online/api/businesses/uid/${b["uid"]}';
        var res = await http.get(prodUrl);
        if (res.statusCode == 200) {
          var json = convert.jsonDecode(res.body);

          List<dynamic> prodRaw = json['Products'];

          if (prodRaw.length != 0) {
            List<Product> prodParsed = [];
            prodRaw.forEach((p) {
              prodParsed.add(new Product(
                  int.parse(p['pid']),
                  int.parse(p['bid']),
                  p['name'],
                  int.parse(p['catid']),
                  int.parse(p['quantity']),
                  p['price'],
                  p['desc'],
                  p['photoURL']));
            });

            Business business = new Business(
                int.parse(json['bid']),
                json['uid'],
                json['name'],
                json['address'],
                json['phoneNum'],
                prodParsed,
                DateTime.parse(json['openTime']),
                DateTime.parse(json['closeTime']));

            businesses.add(business);
          }
        }
      }
      return businesses;
    } else
      return [];
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
              buttonText = '${inCart.length} items in your cart';
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
        footer: SimpleButton(
          text: buttonText,
          onPress: buttonAction,
        ),
        panel: Container(
            padding: EdgeInsets.only(bottom: 100),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: inCart.length,
              itemBuilder: (context, index) => CartItem(
                  product: inCart[index], removeFromCart: removeFromCart),
            )),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: RichText(
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400))
                                ]),
                          )),
                      Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Settings(
                                          user: widget.user,
                                          logoutCallback:
                                              widget.logoutCallback)),
                                );
                              },
                              child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(widget.user.user.photoUrl))))
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, left: 30, right: 30),
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
                      ))),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 100),
                          child: ListView.builder(
                              itemCount: this.businesses.length,
                              itemBuilder: (context, index) => QuickViewShop(
                                  business: this.businesses[index],
                                  addToCart: addToCart))))
                ]))));
  }
}
