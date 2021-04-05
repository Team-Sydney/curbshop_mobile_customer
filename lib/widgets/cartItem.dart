import 'package:intl/intl.dart';

import 'package:curbshop_mobile_customer/backend/models/CartProduct.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/incrementStepper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  final CartProduct cartProduct;
  final Function(int value, CartProduct cartProduct) incremented;
  final Function(int value, CartProduct cartProduct) decremented;

  const CartItem(
      {Key key, this.cartProduct, this.incremented, this.decremented})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Container(
            padding: EdgeInsets.all(14),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(8),
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 243, 243, 1.0),
                    borderRadius: BorderRadius.circular(24)),
                child: Image(
                    image: cartProduct.product.image, fit: BoxFit.contain),
              ),
              Container(
                  width: 110,
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.cartProduct.product.name,
                          style: GoogleFonts.poppins()),
                      Text(
                        "${formatCurrency.format(this.cartProduct.product.price * (this.cartProduct.quantity / this.cartProduct.product.pricePer))}",
                        style: GoogleFonts.poppins(
                            color: ThemeColors.title,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                        softWrap: true,
                      )
                    ],
                  )),
              Spacer(),
              IncrementStepper(
                value: cartProduct.quantity,
                incrementBy: cartProduct.product.pricePer,
                incremented: (value) =>
                    this.incremented(value, this.cartProduct),
                decremented: (value) =>
                    this.decremented(value, this.cartProduct),
              )
            ]),
          )),
    );
  }
}
