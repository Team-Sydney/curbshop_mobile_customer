import 'package:curbshop_mobile_customer/backend/models/Store.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final int pricePer;
  final Store store;
  final ImageProvider<Object> image;
  bool inCart;
  bool isWishlisted;

  Product(
      {this.name,
      this.price,
      this.pricePer = 1,
      this.store,
      this.image,
      this.inCart = false,
      this.isWishlisted = false});
}
