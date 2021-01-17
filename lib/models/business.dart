import 'package:shop_mobile_customer/models/product.dart';

class Business {
  int id;
  String uid;
  String name;
  String address;
  String phoneNum;
  List<Product> products;
  DateTime openTime;
  DateTime closeTime;

  Business(int id, String uid, String name, String address, String phoneNum,
      List<Product> products, DateTime openTime, DateTime closeTime) {
    this.id = id;
    this.uid = uid;
    this.name = name;
    this.address = address;
    this.phoneNum = phoneNum;
    this.products = products;
    this.openTime = openTime;
    this.closeTime = closeTime;
  }
}
