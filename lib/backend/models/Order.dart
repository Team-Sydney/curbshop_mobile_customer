import 'package:curbshop_mobile_customer/backend/models/Product.dart';

class Order {
  final int id;
  final String qrCode;
  final DateTime orderTime;
  final List<Product> orderedProducts;

  Order({this.id, this.qrCode, this.orderTime, this.orderedProducts});
}
