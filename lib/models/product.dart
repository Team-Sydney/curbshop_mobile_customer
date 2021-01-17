class Product {
  int id;
  int bid;
  String name;
  int catid;
  int quantity;
  double price;
  String desc;
  String photoURL;

  Product(int id, int bid, String name, int catid, int quantity, double price,
      String desc, String photoURL) {
    this.id = id;
    this.bid = bid;
    this.name = name;
    this.catid = catid;
    this.quantity = quantity;
    this.price = price;
    this.desc = desc;
    this.photoURL = photoURL;
  }
}
