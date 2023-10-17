import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth extends GetxController {
  static Auth instance = Get.find();

  void signUp(String name, String phone_no, String password) async {
    try {
      if (name.isNotEmpty && phone_no.isNotEmpty && password.isNotEmpty) {
        // UserCredential credential = await FirebaseAuth.instance.
      } else {
        Get.snackbar('Missing Details', '');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
