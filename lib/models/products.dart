class Products {
  String name;
  String desc;
  String price;
  String imgUrl;
  String costumer_uid;
  String product_id;

  Products(
      {required this.name,
      required this.desc,
      required this.price,
      required this.imgUrl,
      required this.costumer_uid,
      required this.product_id});

  Map<String, dynamic> toJson() {
    return {
      'name of product': name,
      'description': desc,
      'price': price,
      'image Url': imgUrl,
      'costumer id': costumer_uid,
      'product id': product_id,
    };
  }
}
