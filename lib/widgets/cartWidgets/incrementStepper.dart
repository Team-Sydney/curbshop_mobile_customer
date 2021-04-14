import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncrementStepper extends StatelessWidget {
  final int value;
  final int incrementBy;
  final Function(int value) incremented;
  final Function(int value) decremented;

  const IncrementStepper(
      {Key key,
      @required this.value,
      this.incrementBy = 1,
      this.incremented,
      this.decremented})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 118,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              icon: Icon(
                  (value > incrementBy ? Icons.remove : Icons.delete_outline)),
              onPressed: () => decremented(this.value - this.incrementBy)),
          Text(this.value.toString(), style: GoogleFonts.poppins()),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => incremented(this.value + this.incrementBy))
        ]));
  }
}
