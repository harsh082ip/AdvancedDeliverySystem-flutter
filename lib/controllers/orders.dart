import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Orders {
  // orders by costumer
  static void orderByCostumer(
      String prod_id, String otp, BuildContext buildContext) async {
    QuerySnapshot? snapshots = await FirebaseFirestore.instance
        .collection('products')
        .where('product id', isEqualTo: prod_id)
        .get();

    if (snapshots != null && snapshots.docs.isNotEmpty) {
      log('docs not empty');
      for (DocumentSnapshot doc in snapshots.docs) {
        // Update 'otp' field to '1234'
        await FirebaseFirestore.instance
            .collection('products')
            .doc(doc.id)
            .update({'otp': otp});
        log('Updated OTP for document ID: ${doc.id}');
        // Navigator.pop(context);
      }
    }
    Get.back();
    Get.back();
  }
}
