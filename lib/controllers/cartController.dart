import 'dart:async';

import 'package:curbshop_mobile_customer/backend/models/CartProduct.dart';
import 'package:curbshop_mobile_customer/backend/models/Product.dart';

class CartController {
  List<CartProduct> inCart;

  StreamController<List<CartProduct>> _cartStreamController;
  Stream<List<CartProduct>> cartStream;

  CartController() {
    this.inCart = [];
    this._cartStreamController =
        new StreamController<List<CartProduct>>.broadcast();
    this.cartStream = this._cartStreamController.stream;
  }

  double get totalCost {
    double _totalCost = 0;
    this.inCart.forEach((item) => _totalCost +=
        (item.product.price * (item.quantity / item.product.pricePer)));
    return _totalCost;
  }

  void add(CartProduct cartProduct) {
    this.inCart.add(cartProduct);
    this._cartStreamController.add(this.inCart);
  }

  void remove({CartProduct cartProduct, Product product, int index}) {
    if (cartProduct != null)
      this.inCart.remove(cartProduct);
    else if (product != null)
      this.inCart.removeWhere((cartProduct) => cartProduct.product == product);
    else if (index != null) this.inCart.removeAt(index);
    this._cartStreamController.add(this.inCart);
  }
}
