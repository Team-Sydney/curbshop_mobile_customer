import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_mobile_customer/models/product.dart';

import '../themes/colors.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final Function(Product) removeFromCart;

  const CartItem(
      {Key key, @required this.product, @required this.removeFromCart})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: Container(
              width: 48,
              height: 48,
              child: Image.network(
                product.photoURL,
                fit: BoxFit.cover,
              )),
          title: Text(
            product.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            product.desc,
            style: TextStyle(fontSize: 14),
          ),
          trailing: Text('\$${product.price}'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Remove',
          color: ThemeColors.lightGrey,
          icon: Icons.delete,
          onTap: () => {removeFromCart(product)},
        )
      ],
    );
  }
}
