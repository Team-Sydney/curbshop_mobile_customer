import 'package:curbshop_mobile_customer/backend/models/Order.dart';
import 'package:curbshop_mobile_customer/backend/models/Vehicle.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Customer {
  final String uid;
  final String phoneNum;
  final List<Vehicle> vehicles;
  final List<Order> orders;
  final FirebaseUser user;

  Customer({this.uid, this.phoneNum, this.user, this.vehicles, this.orders});

  String toString() {
    return 'UID: ${this.uid}, PhoneNum: ${this.phoneNum}, Vs: ${this.vehicles}, Os: ${this.orders}';
  }
}
