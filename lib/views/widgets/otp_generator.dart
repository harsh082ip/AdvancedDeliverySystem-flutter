import 'dart:math';

class ProductOTPGenerator {
  static String generateOTP() {
    final random = Random();
    // final alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    final numbers = '0123456789';
    final characters = numbers;

    String uniqueId = '';

    for (int i = 0; i < 6; i++) {
      uniqueId += characters[random.nextInt(characters.length)];
    }

    return uniqueId;
  }
}
