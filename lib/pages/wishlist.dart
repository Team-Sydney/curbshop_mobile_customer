import 'package:curbshop_mobile_customer/widgets/pageHeader.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({
    Key key,
  }) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<WishlistPage> {
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
                    icon: Icons.favorite_border,
                    title: 'Wishlist',
                  )
                ]))));
  }
}
