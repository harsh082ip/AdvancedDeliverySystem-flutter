class UserKeys {
  String uniqueKey;
  List<String> codes;

  UserKeys({
    required this.uniqueKey,
    required this.codes,
  });

  Map<String, dynamic> toJson() {
    return {
      'Unique Key': uniqueKey,
      'Codes': codes,
      'Assigned to': 'none',
    };
  }
}
