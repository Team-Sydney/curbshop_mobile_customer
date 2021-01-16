class Order {
  int id;
  String qrCode;
  DateTime orderTime;

  Order(int id, String qrCode, DateTime orderTime) {
    this.id = id;
    this.qrCode = qrCode;
    this.orderTime = orderTime;
  }
}
