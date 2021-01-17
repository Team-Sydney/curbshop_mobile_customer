import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shop_mobile_customer/models/order.dart';
import '../themes/colors.dart';

class QrCodePage extends StatefulWidget {
  QrCodePage({Key key, this.order}) : super(key: key);

  final Order order;

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.offWhite,
        body: SafeArea(
            child: Container(
                padding:
                    EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ]),
                      Center(
                          heightFactor: 2.5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ThemeColors.lightGrey,
                                borderRadius: BorderRadius.circular(5)),
                            child: QrImage(
                              data: widget.order.qrCode,
                              version: QrVersions.auto,
                              errorCorrectionLevel: QrErrorCorrectLevel.M,
                              size: 250,
                            ),
                          )),
                      Text('${widget.order.id}')
                    ]))));
  }
}
