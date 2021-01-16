import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../themes/colors.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('SD'),
            foregroundColor: Colors.white,
          ),
          title: Text(
            'Sprinkle Dognut',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            'Dave\'s Dognuts',
            style: TextStyle(fontSize: 14),
          ),
          trailing: Text('\$3.49'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Remove',
          color: ThemeColors.lightGrey,
          icon: Icons.delete,
          onTap: () => {},
        )
      ],
    );
  }
}
