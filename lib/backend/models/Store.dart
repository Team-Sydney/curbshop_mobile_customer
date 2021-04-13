import 'package:curbshop_mobile_customer/backend/models/Product.dart';

class Store {
  final int id;
  final String name;
  final String address;
  final String phoneNum;
  final List<Product> products;
  final DateTime openTime;
  final DateTime closeTime;

  Store(
      {this.id,
      this.name,
      this.address,
      this.phoneNum,
      this.products,
      this.openTime,
      this.closeTime});
}
