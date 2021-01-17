import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_mobile_customer/models/customerUser.dart';

import 'package:http/http.dart' as http;
import 'package:shop_mobile_customer/models/order.dart';
import 'dart:convert' as convert;

import 'package:shop_mobile_customer/models/vehicle.dart';

class Auth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  static Future<CustomerUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      CustomerUser customerUser = await getUserFromServer(currentUser);
      if (customerUser != null) return customerUser;

      await signOutGoogle();
      return null;
    }

    return null;
  }

  static Future<CustomerUser> getUserFromServer(FirebaseUser user) async {
    String url = 'https://api.curbshop.online/api/customers/user/${user.uid}';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      List<dynamic> vehRaw = json['Vehicles'];
      List<dynamic> ordRaw = json['Orders'];

      List<Vehicle> vehParsed = [];
      vehRaw.forEach((v) {
        vehParsed.add(new Vehicle(int.parse(v['vid']), v['brand'], v['model'],
            v['color'], v['license']));
      });

      List<Order> ordParsed = [];
      ordRaw.forEach((o) {
        ordParsed.add(new Order(
            int.parse(o['oid']), o['qrCode'], DateTime.parse(o['orderTime'])));
      });

      CustomerUser customerUser = new CustomerUser(int.parse(json['cid']),
          json['uid'], json['phoneNum'], vehParsed, ordParsed, user);

      print(customerUser.toString());

      return customerUser;
    }
    return null;
  }

  static Future<void> signOutGoogle() async {
    await googleSignIn.signOut();
  }
}
