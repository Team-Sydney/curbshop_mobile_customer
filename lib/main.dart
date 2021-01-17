import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_mobile_customer/auth/auth.dart';
import 'package:shop_mobile_customer/custom/customScrollBehaviour.dart';
import 'package:shop_mobile_customer/models/customerUser.dart';

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
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: CustomScrollBehaviour(),
            child: child,
          );
        },
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

  AuthStatus status = AuthStatus.NOT_DETERMINED;
  Widget page;

  CustomerUser user;

  @override
  void initState() {
    super.initState();

    auth.onAuthStateChanged.listen((FirebaseUser user) {
      if (user == null) {
        setState(() {
          status = AuthStatus.NOT_LOGGED_IN;
        });
      } else {
        Auth.getUserFromServer(user).then((customerUser) => {
              if (customerUser != null)
                {
                  setState(() {
                    status = AuthStatus.LOGGED_IN;
                    this.user = customerUser;
                  })
                }
              else
                {status = AuthStatus.NOT_LOGGED_IN}
            });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loginCallback() async {
    Auth.signInWithGoogle()
        .then((user) => {
              setState(() {
                this.user = user;
                status = AuthStatus.LOGGED_IN;
              })
            })
        .catchError((err) => print(err));
  }

  void logoutCallback() async {
    Auth.signOutGoogle().then((v) => {
          Navigator.pop(context),
          setState(() {
            status = AuthStatus.NOT_LOGGED_IN;
          })
        });
  }

  Widget buildWaiting() {
    return Scaffold(
      backgroundColor: ThemeColors.offWhite,
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
            user: this.user,
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
    return new Scaffold(body: page);
  }
}
