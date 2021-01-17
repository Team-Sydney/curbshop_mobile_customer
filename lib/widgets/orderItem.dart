import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../themes/colors.dart';

class OrderItem extends StatelessWidget {
  final String qrCode;
  final int oid;
  final VoidCallback onPress;

  const OrderItem({Key key, this.qrCode, this.oid, this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: ThemeColors.offWhite,
              borderRadius: BorderRadius.circular(5)),
          child: QrImage(
            data: qrCode,
            version: QrVersions.auto,
            errorCorrectionLevel: QrErrorCorrectLevel.M,
          ),
        ));
  }
}
