import 'package:flutter/material.dart';
import 'package:shop_mobile_customer/themes/colors.dart';

class CarText extends StatelessWidget {
  final String color;
  final String brand;
  final String model;
  final String license;
  final int vid;

  const CarText(
      {Key key, this.color, this.brand, this.model, this.license, this.vid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ThemeColors.lightGrey),
        child: Column(children: [
          Row(children: [
            Expanded(
                child: TextFormField(
              textCapitalization: TextCapitalization.words,
              initialValue: color,
              decoration:
                  InputDecoration(hintText: "Color", border: InputBorder.none),
            )),
            Expanded(
                child: TextFormField(
              textCapitalization: TextCapitalization.words,
              initialValue: license,
              decoration: InputDecoration(
                  hintText: "License", border: InputBorder.none),
            )),
          ]),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                textCapitalization: TextCapitalization.words,
                initialValue: brand,
                decoration:
                    InputDecoration(hintText: "Make", border: InputBorder.none),
              )),
              Expanded(
                  child: TextFormField(
                textCapitalization: TextCapitalization.words,
                initialValue: model,
                decoration: InputDecoration(
                    hintText: "Model", border: InputBorder.none),
              )),
            ],
          ),
        ]));
  }
}
