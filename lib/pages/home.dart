import 'package:curbshop_mobile_customer/backend/models/CartProduct.dart';
import 'package:curbshop_mobile_customer/backend/models/Product.dart';
import 'package:curbshop_mobile_customer/backend/models/Store.dart';
import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:curbshop_mobile_customer/widgets/cartItem.dart';
import 'package:curbshop_mobile_customer/widgets/featuredItem.dart';
import 'package:curbshop_mobile_customer/widgets/header.dart';
import 'package:curbshop_mobile_customer/widgets/inputField.dart';
import 'package:curbshop_mobile_customer/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final CustomPanelController customPanelController;

  const HomePage({Key key, @required this.customPanelController})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List<CartProduct> cartItems;
  List<Product> featuredItems;

  @override
  void initState() {
    super.initState();

    cartItems = [];
    featuredItems = [];
    featuredItems.addAll([
      Product(
          name: "Cotton Sweater",
          store: new Store("Mary's Homemade Sweaters"),
          price: 28.99,
          image: NetworkImage(
              "https://i.pinimg.com/originals/f2/9e/da/f29edab5463bab46d0312807906ecbc8.png")),
      Product(
          name: "Various Donuts",
          store: new Store("Dave's Donuts"),
          price: 6.98,
          pricePer: 12,
          image: NetworkImage(
              "https://i.pinimg.com/originals/95/59/60/955960ca32b06e1a416dc678f48210bf.png")),
      Product(
          name: "Vans MoMA ComfyCrush",
          store: new Store("Foot Locker"),
          price: 99.98,
          image: NetworkImage(
              "https://images.vans.com/is/image/VansBrand/f20-moma-product-moma-era?wid=500&fmt=png-alpha")),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Header(
                title: "curbshop",
                circleImage: NetworkImage(
                    "https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg"),
                iconButton: (cartItems.length > 0
                    ? Icons.shopping_bag
                    : Icons.shopping_bag_outlined),
                iconOnPressed: () {
                  widget.customPanelController.panelContentController
                      .add(Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Cart",
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
                              child: ListView.builder(
                                  itemCount: cartItems.length,
                                  itemBuilder: (context, index) {
                                    return CartItem(
                                      cartProduct: cartItems[index],
                                      incremented: (value, product) {
                                        setState(() {
                                          cartItems[index].quantity = value;
                                        });
                                      },
                                      decremented: (value, cartProduct) {
                                        setState(() {
                                          if (value < 1) {
                                            cartItems.removeAt(index);
                                            cartProduct.product.inCart = false;
                                          } else
                                            cartItems[index].quantity = value;
                                        });
                                      },
                                    );
                                  }))),
                      PrimaryButton(onPressed: () {}, label: "Checkout")
                    ],
                  ));
                  widget.customPanelController.openPanel();
                },
                imageOnPressed: () => widget.customPanelController.openPanel()),
            InputField(
              label: "Search",
              icon: Icons.search,
            )
          ])),
      Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          margin: EdgeInsets.only(top: 20),
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            itemCount: featuredItems.length,
            itemBuilder: (context, index) {
              return FeaturedItem(
                product: featuredItems[index],
                cartOnPress: (product) {
                  setState(() {
                    product.inCart = !product.inCart;

                    if (product.inCart)
                      cartItems.add(CartProduct(product.pricePer, product));
                    else
                      cartItems.removeWhere((item) => item.product == product);
                  });
                },
                wishlistOnPress: (product) {
                  setState(() {
                    product.isWishlisted = !product.isWishlisted;
                  });
                },
              );
            },
          ))
    ]);
  }
}
