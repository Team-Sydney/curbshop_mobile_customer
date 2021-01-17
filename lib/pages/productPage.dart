import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/models/product.dart';
import 'package:shop_mobile_customer/widgets/simpleButton.dart';
import '../themes/colors.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key, @required this.product, @required this.addToCart})
      : super(key: key);

  final Product product;
  final Function(Product) addToCart;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
        backgroundColor: ThemeColors.offWhite,
        body: SafeArea(
            child: Container(
                padding:
                    EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ]),
                      Center(
                          child: Container(
                        padding: EdgeInsets.all(15),
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Image.network(widget.product.photoURL,
                            fit: BoxFit.cover),
                      )),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${widget.product.name}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              Text('\$${widget.product.price}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400))
                            ],
                          )),
                      SimpleButton(
                          text: "Add to cart",
                          onPress: () {
                            widget.addToCart(widget.product);
                            Navigator.pop(context);
                          })
                    ]))));
  }
}
