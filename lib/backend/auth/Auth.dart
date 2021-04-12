import 'package:curbshop_mobile_customer/backend/Config.dart';
import 'package:curbshop_mobile_customer/backend/UserAgent.dart';
import 'package:curbshop_mobile_customer/backend/models/Customer.dart';
import 'package:curbshop_mobile_customer/backend/models/Order.dart';
import 'package:curbshop_mobile_customer/backend/models/Vehicle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  static final UserAgent _client = UserAgent(http.Client());

  static Future<FirebaseUser> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final FirebaseUser currentUser = await _auth.currentUser();
        assert(user.uid == currentUser.uid);

        if (currentUser != null) return currentUser;

        await signOutGoogle();
        return null;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  static Future<Customer> getUserFromServer(FirebaseUser user) async {
    var response = await _client
        .get(new Uri.https(Config.apiUrl, '/api/customers/user/${user.uid}'));
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      List<dynamic> vehRaw = json['Vehicles'];
      List<dynamic> ordRaw = json['Orders'];

      List<Vehicle> vehParsed = [];
      vehRaw.forEach((v) {
        vehParsed.add(new Vehicle(
            id: int.parse(v['vid']),
            brand: v['brand'],
            model: v['model'],
            color: v['color'],
            license: v['license']));
      });

      List<Order> ordParsed = [];
      ordRaw.forEach((o) {
        ordParsed.add(new Order(
            id: int.parse(o['oid']),
            qrCode: o['qrCode'],
            orderTime: DateTime.parse(o['orderTime'])));
      });

      Customer customer = new Customer(
          uid: json['customerId'],
          phoneNum: json['phoneNum'],
          vehicles: vehParsed,
          orders: ordParsed,
          user: user);

      return customer;
    } else {
      print('RESPONSE');
      print('Status: ${response.statusCode}');
      print('Error: ${response.body}');
    }
    return null;
  }

  static Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
  }
}
