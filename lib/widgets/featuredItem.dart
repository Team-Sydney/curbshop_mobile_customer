import 'package:curbshop_mobile_customer/backend/models/Product.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedItem extends StatelessWidget {
  final Product product;
  final Function(Product) wishlistOnPress;
  final Function(Product) cartOnPress;

  const FeaturedItem(
      {Key key,
      @required this.product,
      @required this.wishlistOnPress,
      @required this.cartOnPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Container(
            padding: EdgeInsets.all(12.5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 294,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 243, 243, 1.0),
                      borderRadius: BorderRadius.circular(24)),
                  child: Image(image: this.product.image, fit: BoxFit.contain)),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: 16, left: 8),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(this.product.name, style: GoogleFonts.poppins()),
                        RichText(
                            text: TextSpan(
                                text: "\$${this.product.price}",
                                style: GoogleFonts.poppins(
                                    color: ThemeColors.title,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                                children: [
                              TextSpan(
                                  text: (this.product.pricePer > 1
                                      ? " for ${this.product.pricePer}"
                                      : ""),
                                  style: GoogleFonts.poppins(
                                      color: ThemeColors.title,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400))
                            ]))
                      ],
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        IconButton(
                            icon: Icon((this.product.isWishlisted
                                ? Icons.favorite
                                : Icons.favorite_border)),
                            onPressed: () {
                              this.wishlistOnPress(this.product);
                            }),
                        IconButton(
                            icon: Icon((this.product.inCart
                                ? Icons.shopping_bag
                                : Icons.shopping_bag_outlined)),
                            onPressed: () {
                              this.cartOnPress(this.product);
                            })
                      ],
                    )
                  ],
                ),
              ))
            ]),
          )),
    );
  }
}
