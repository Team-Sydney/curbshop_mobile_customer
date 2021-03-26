import 'package:curbshop_mobile_customer/controllers/customPanelController.dart';
import 'package:curbshop_mobile_customer/pages/home.dart';
import 'package:curbshop_mobile_customer/pages/login.dart';
import 'package:curbshop_mobile_customer/pages/onboarding/onboardNumber.dart';
import 'package:curbshop_mobile_customer/pages/onboarding/onboardVehicle.dart';
import 'package:curbshop_mobile_customer/pages/onboarding/onboardVerify.dart';
import 'package:curbshop_mobile_customer/pages/onboarding/onboardWelcome.dart';
import 'package:curbshop_mobile_customer/themes/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new App());
  });
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curbshop Customer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Root(),
    );
  }
}

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthStates _authState = AuthStates.LOGGED_IN;

  PanelController _panelController = PanelController();
  CustomPanelController _customPanelController;

  Widget _page;
  Widget _panelContent;

  @override
  void initState() {
    super.initState();

    _customPanelController = CustomPanelController(_panelController);
    _firebaseAuth.onAuthStateChanged.listen((FirebaseUser user) {});
    _customPanelController.panelContent.listen((event) {
      setState(() {
        this._panelContent = event;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loginCallback() async {}

  void logoutCallback() async {}

  Widget buildWaiting() {
    return Center(child: CircularProgressIndicator.adaptive());
  }

  @override
  Widget build(BuildContext context) {
    switch (_authState) {
      case AuthStates.LOGGED_IN:
        setState(() {
          _page = HomePage(
            customPanelController: _customPanelController,
          );
        });
        break;

      case AuthStates.LOGGED_OUT:
        setState(() {
          _page = LoginPage(
            customPanelController: _customPanelController,
          );
        });
        break;

      case AuthStates.UNKNOWN:
        setState(() {
          _page = buildWaiting();
        });
        break;
    }
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: SlidingUpPanel(
        controller: _panelController,
        color: ThemeColors.offWhite,
        maxHeight: MediaQuery.of(context).size.height / 1.5,
        minHeight: 0,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        backdropEnabled: true,
        backdropColor: ThemeColors.title,
        backdropOpacity: 0.25,
        onPanelOpened: () =>
            _customPanelController.updateStream(isPanelOpen: true),
        onPanelClosed: () =>
            _customPanelController.updateStream(isPanelOpen: false),
        panel: SafeArea(
            child: Container(
          padding: EdgeInsets.only(
              left: 24,
              top: MediaQuery.of(context).size.height * 0.005,
              right: 24,
              bottom: MediaQuery.of(context).size.height * 0.005),
          child: _panelContent,
          // child: OnboardVehicle(customPanelController: _customPanelController),
        )),
        body: SafeArea(
          child: _page,
        ),
      ),
    );
  }
}

enum AuthStates { UNKNOWN, LOGGED_IN, LOGGED_OUT }
