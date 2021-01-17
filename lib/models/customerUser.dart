import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_mobile_customer/models/order.dart';
import 'package:shop_mobile_customer/models/vehicle.dart';

class CustomerUser {
  int id;
  String uid;
  String phoneNum;
  List<Vehicle> vehicles = [];
  List<Order> orders = [];
  FirebaseUser user;

  CustomerUser(int id, String uid, String phoneNum, List<Vehicle> vehicles,
      List<Order> orders, FirebaseUser user) {
    this.id = id;
    this.uid = uid;
    this.phoneNum = phoneNum;
    this.user = user;
    this.vehicles = vehicles;
    this.orders = orders;
  }

  String toString() {
    return 'ID: ${this.id}, UID: ${this.uid}, PhoneNum: ${this.phoneNum}, Vs: ${this.vehicles}, Os: ${this.orders}';
  }
}
