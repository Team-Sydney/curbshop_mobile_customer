import 'package:curbshop_mobile_customer/backend/models/CartProduct.dart';
import 'package:curbshop_mobile_customer/controllers/cartController.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/cartItem.dart';
import 'package:curbshop_mobile_customer/widgets/primaryButton.dart';
import 'package:curbshop_mobile_customer/widgets/undrawIllustration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CartPopup extends StatefulWidget {
  final CartController cartController;
  const CartPopup({Key key, @required this.cartController}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<CartPopup> {
  final formatCurrency = NumberFormat.simpleCurrency();
  List<CartProduct> inCart;

  @override
  void initState() {
    super.initState();
    inCart = [];

    widget.cartController.cartStream.listen((products) {
      setState(() {
        this.inCart = products;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          (this.inCart.length > 0
              ? "${this.inCart.length} item${this.inCart.length == 1 ? "" : "s"}"
              : "Cart"),
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              color: ThemeColors.title,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              height: 1.1),
        ),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: (inCart.length > 0
                    ? ListView.builder(
                        itemCount: inCart.length,
                        itemBuilder: (context, index) {
                          return CartItem(
                            cartProduct: inCart[index],
                            incremented: (value, product) {
                              setState(() {
                                inCart[index].quantity = value;
                              });
                            },
                            decremented: (value, cartProduct) {
                              setState(() {
                                if (value < 1) {
                                  widget.cartController.remove(index: index);
                                  cartProduct.product.inCart = false;
                                } else
                                  inCart[index].quantity = value;
                              });
                            },
                          );
                        })
                    : UndrawIllustration(
                        name: "undraw_add_to_cart", ext: "png")))),
        (inCart.length > 0
            ? PrimaryButton(
                onPressed: () {},
                label:
                    ("Checkout • ${formatCurrency.format(widget.cartController.totalCost)}"))
            : Container())
      ],
    );
  }
}
