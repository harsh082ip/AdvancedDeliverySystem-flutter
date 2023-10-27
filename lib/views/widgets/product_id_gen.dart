import 'dart:math';

class ProductIDGenerator {
  static String generateUniqueId() {
    final random = Random();
    // final alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    final numbers = '0123456789';
    final characters = numbers;

    String uniqueId = '';

    for (int i = 0; i < 5; i++) {
      uniqueId += characters[random.nextInt(characters.length)];
    }

    return uniqueId;
  }
}
