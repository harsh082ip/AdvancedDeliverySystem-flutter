class MyUser {
  String phone_no;
  String password;
  String name;
  String role;
  String uid;

  MyUser(
      {required this.name,
      required this.phone_no,
      required this.password,
      required this.role,
      required this.uid});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone_no': phone_no,
      'password': password,
      'role': role,
      'uid': uid
    };
  }
}
