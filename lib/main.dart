import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_mobile_customer/widgets/cartItem.dart';
import 'package:shop_mobile_customer/widgets/simpleButton.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shop_mobile_customer/pages/home.dart';
import 'package:shop_mobile_customer/pages/login.dart';
import 'package:shop_mobile_customer/themes/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new ShopCustomer());
  });
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class ShopCustomer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          backgroundColor: ThemeColors.black,
          canvasColor: ThemeColors.offWhite,
          fontFamily: 'Quicksand',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Root());
  }
}

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  FirebaseAuth auth = FirebaseAuth.instance;
  PanelController panel = new PanelController();

  AuthStatus status = AuthStatus.LOGGED_IN;
  Widget page;

  String buttonText;
  VoidCallback buttonAction;

  @override
  void initState() {
    super.initState();

    buttonText = "0 items in your cart";
    buttonAction = openPanel;

    // auth.onAuthStateChanged.listen((FirebaseUser user) {
    //   if (user == null) {
    //     setState(() {
    //       status = AuthStatus.NOT_LOGGED_IN;
    //     });
    //   } else {
    //     setState(() {
    //       status = AuthStatus.LOGGED_IN;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loginCallback() async {
    setState(() {
      status = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() async {
    setState(() {
      status = AuthStatus.NOT_LOGGED_IN;
    });
  }

  void openPanel() {
    panel.open();
  }

  void checkout() {
    print("CHECKOUT");
  }

  Widget buildWaiting() {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AuthStatus.NOT_DETERMINED:
        setState(() {
          page = buildWaiting();
        });
        break;
      case AuthStatus.NOT_LOGGED_IN:
        setState(() {
          page = Login(
            loginCallback: loginCallback,
          );
        });
        break;
      case AuthStatus.LOGGED_IN:
        setState(() {
          page = Home(
            logoutCallback: logoutCallback,
          );
        });
        break;
      default:
        setState(() {
          page = Login(
            loginCallback: loginCallback,
          );
        });
        break;
    }
    return new Scaffold(
        body: SlidingUpPanel(
      controller: panel,
      onPanelClosed: () => setState(() {
        buttonText = "0 items in your cart";
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
      footer: Center(
          child: SimpleButton(
        text: buttonText,
        onPress: buttonAction,
      )),
      panel: Container(
          padding: EdgeInsets.only(bottom: 57),
          child: ListView(padding: EdgeInsets.all(0), children: [CartItem()])),
      body: page,
    ));
  }
}
