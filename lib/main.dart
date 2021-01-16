import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_mobile_business/pages/home.dart';
import 'package:shop_mobile_business/pages/login.dart';
import 'package:shop_mobile_business/themes/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new ShopBusiness());
  });
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class ShopBusiness extends StatelessWidget {
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
  AuthStatus status = AuthStatus.NOT_DETERMINED;
  Widget page;

  @override
  void initState() {
    super.initState();

    auth.onAuthStateChanged.listen((FirebaseUser user) {
      if (user == null) {
        setState(() {
          status = AuthStatus.NOT_LOGGED_IN;
        });
      } else {
        setState(() {
          status = AuthStatus.LOGGED_IN;
        });
      }
    });
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
    return new Scaffold(body: page);
  }
}
