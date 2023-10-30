class Products {
  String prod_name;
  String desc;
  String price;
  String imgUrl;
  String seller_uid;
  String product_id;

  Products(
      {required this.prod_name,
      required this.desc,
      required this.price,
      required this.imgUrl,
      required this.seller_uid,
      required this.product_id});

  Map<String, dynamic> toJson() {
    return {
      'name of product': prod_name,
      'description': desc,
      'price': price,
      'image Url': imgUrl,
      'seller id': seller_uid,
      'product id': product_id,
      'is item ordered': 'no',
      'otp': [],
      'assigned to': 'none',
      'ordered by': []
    };
  }
}
