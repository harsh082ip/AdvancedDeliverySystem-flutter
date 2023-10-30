import 'dart:math';

class GenIdandCodes {
  static List<String> generateRandomCodes() {
    List<String> codes = [];
    Random random = Random();
    Set<String> uniqueCodes = Set();

    while (uniqueCodes.length < 200) {
      String code = (100000 + random.nextInt(900000)).toString();
      uniqueCodes.add(code);
    }

    codes = uniqueCodes.toList(); // Convert set to list

    return codes;
  }

  static String generateID() {
    final random = Random();
    final alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    final numbers = '0123456789';
    final characters = numbers;

    String uniqueId = '';

    for (int i = 0; i < 15; i++) {
      uniqueId += characters[random.nextInt(characters.length)];
    }

    return uniqueId;
  }
}
