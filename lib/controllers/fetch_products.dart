import 'package:cloud_firestore/cloud_firestore.dart';

class FetchProducts {
  // for seller
  static Stream<QuerySnapshot> fetchProductsforSeller(String seller_id) {
    if (seller_id.isNotEmpty) {
      return FirebaseFirestore.instance
          .collection('products')
          .where('seller id', isEqualTo: seller_id)
          .snapshots();
    } else {
      return Stream.empty();
    }
  }

  // for costumer
  static Stream<QuerySnapshot> fetchProductsforCostumer() {
    return FirebaseFirestore.instance
        .collection('products')
        .where('is item ordered', isEqualTo: 'no')
        .where('otp', isEqualTo: 'none')
        .snapshots();
  }
}
