import 'package:advanced_delivery_system/models/user_keys.dart';
import 'package:advanced_delivery_system/views/widgets/gen_random_user_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CodesController {
  static void genIdAndCodes() async {
    UserKeys userKeys = UserKeys(
        uniqueKey: GenIdandCodes.generateID(),
        codes: GenIdandCodes.generateRandomCodes());
    await FirebaseFirestore.instance
        .collection('ID and Codes')
        .add(userKeys.toJson())
        .then((value) => Get.back());
  }
}
