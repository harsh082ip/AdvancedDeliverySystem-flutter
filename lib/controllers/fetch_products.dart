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
}
