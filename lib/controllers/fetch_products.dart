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
  static Stream<QuerySnapshot> fetchProductsforCostumer(String cost_id) {
    return FirebaseFirestore.instance.collection('products').snapshots();
  }

  // fetch for ordered products section
  static Stream<QuerySnapshot> fetchForOrderedProductsSection(String cost_id) {
    return FirebaseFirestore.instance
        .collection('products')
        .where('ordered by', arrayContains: cost_id)
        .snapshots();
  }

  static fetchProductSnaps() async {
    return await FirebaseFirestore.instance.collection('products').get();
  }

  // products ordered by costumer (will be different  iated)
  static Stream<QuerySnapshot> fetchOrderedProducts(
      String cost_id, String otp) {
    return FirebaseFirestore.instance
        .collection('products')
        .where('ordered by', arrayContains: cost_id)
        .where('otp', arrayContains: otp)
        .snapshots();
  }
}
