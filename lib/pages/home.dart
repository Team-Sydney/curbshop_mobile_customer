import 'package:curbshop_mobile_customer/backend/models/CartProduct.dart';
import 'package:curbshop_mobile_customer/backend/models/Customer.dart';
import 'package:curbshop_mobile_customer/backend/models/Product.dart';
import 'package:curbshop_mobile_customer/backend/models/Store.dart';
import 'package:curbshop_mobile_customer/controllers/cartController.dart';
import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/pages/orders.dart';
import 'package:curbshop_mobile_customer/pages/settings.dart';
import 'package:curbshop_mobile_customer/pages/wishlist.dart';
import 'package:curbshop_mobile_customer/widgets/homeWidgets/featuredItem.dart';
import 'package:curbshop_mobile_customer/widgets/homeWidgets/header.dart';
import 'package:curbshop_mobile_customer/widgets/inputField.dart';
import 'package:curbshop_mobile_customer/widgets/homeWidgets/popupMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  final CustomPanelController customPanelController;
  final CartController cartController;
  final Function logoutCallback;
  final Customer currentCustomer;

  const HomePage(
      {Key key,
      @required this.customPanelController,
      @required this.cartController,
      @required this.logoutCallback,
      @required this.currentCustomer})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List<Product> featuredItems;
  List<CartProduct> inCart;

  bool showMenu = false;

  @override
  void initState() {
    super.initState();

    inCart = [];
    widget.cartController.cartStream.listen((products) {
      setState(() {
        this.inCart = products;
      });
    });

    featuredItems = [];
    featuredItems.addAll([
      Product(
          name: "Cotton Sweater",
          store: new Store(name: "Mary's Homemade Sweaters"),
          price: 28.99,
          image: ResizeImage(
              NetworkImage(
                  "https://i.pinimg.com/originals/f2/9e/da/f29edab5463bab46d0312807906ecbc8.png"),
              width: 285,
              height: 262)),
      Product(
          name: "Various Donuts",
          store: new Store(name: "Dave's Donuts"),
          price: 6.98,
          pricePer: 12,
          image: ResizeImage(
              NetworkImage(
                  "https://i.pinimg.com/originals/95/59/60/955960ca32b06e1a416dc678f48210bf.png"),
              width: 285,
              height: 262)),
      Product(
          name: "Vans MoMA ComfyCrush",
          store: new Store(name: "Foot Locker"),
          price: 99.98,
          image: ResizeImage(
              NetworkImage(
                  "https://images.vans.com/is/image/VansBrand/f20-moma-product-moma-era?wid=500&fmt=png-alpha"),
              width: 285,
              height: 262)),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Header(
                      title: "curbshop",
                      circleImage:
                          NetworkImage(widget.currentCustomer.user.photoUrl),
                      iconButton: (inCart.length > 0
                          ? Icons.shopping_bag
                          : Icons.shopping_bag_outlined),
                      amountInCart: inCart.length,
                      iconOnPressed: () =>
                          widget.customPanelController.openPanel(),
                      imageOnPressed: () => setState(() {
                            this.showMenu = !this.showMenu;
                          })),
                  InputField(
                    label: "Search",
                    icon: Icons.search,
                  )
                ])),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            margin: EdgeInsets.only(top: 20),
            child: (featuredItems.length > 0
                ? ListView.builder(
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
                              widget.cartController
                                  .add(CartProduct(product.pricePer, product));
                            else
                              widget.cartController.remove(product: product);
                          });
                        },
                        wishlistOnPress: (product) {
                          setState(() {
                            product.isWishlisted = !product.isWishlisted;
                          });
                        },
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator.adaptive())))
      ]),
      PopupMenu(
        showMenu: this.showMenu,
        menuItems: [
          CustomPopupMenuItem(
              onPressed: () => {
                    setState(() {
                      this.showMenu = !this.showMenu;
                    }),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WishlistPage()))
                  },
              icon: Icons.favorite_border,
              label: "Wishlisted"),
          CustomPopupMenuItem(
              onPressed: () => {
                    setState(() {
                      this.showMenu = !this.showMenu;
                    }),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrdersPage()))
                  },
              icon: FlutterIcons.package_fea,
              label: "Orders"),
          CustomPopupMenuItem(
              onPressed: () => {
                    setState(() {
                      this.showMenu = !this.showMenu;
                    }),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingsPage()))
                  },
              icon: Icons.settings_outlined,
              label: "Settings"),
          CustomPopupMenuItem(
              onPressed: () {},
              icon: FlutterIcons.logout_ant,
              label: "Logout",
              color: Color.fromRGBO(255, 102, 102, 1.0))
        ],
      )
    ]);
  }
}
