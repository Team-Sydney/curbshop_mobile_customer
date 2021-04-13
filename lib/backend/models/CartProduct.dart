import 'package:curbshop_mobile_customer/backend/models/Product.dart';

class CartProduct {
  int quantity;
  final Product product;

  CartProduct(this.quantity, this.product);
}
