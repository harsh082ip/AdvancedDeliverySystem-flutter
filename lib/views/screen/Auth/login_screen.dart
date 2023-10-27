import 'dart:developer';

import 'package:advanced_delivery_system/controllers/firebase_auth.dart';
import 'package:advanced_delivery_system/views/screen/Auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  String role;
  LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final finalPhoneNo = '+91';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clearCurrentUsers();
  }

  clearCurrentUsers() async {
    await FirebaseAuth.instance.signOut();
    log('no current users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Color.fromARGB(255, 173, 109, 45),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/shopping.png'),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Login to your  Account',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0, top: 25.0),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Make your shopping life easier!',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 22.0, left: 15.0, right: 15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone No.',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 173, 109, 45)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 173, 109,
                                45)), // Change the border color here
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 173, 109,
                                45)), // Change the border color here
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 22.0, left: 15.0, right: 15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 173, 109, 45)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 173, 109,
                                45)), // Change the border color here
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 173, 109,
                                45)), // Change the border color here
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 45.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Color.fromARGB(255, 173, 109, 45)),
                      onPressed: () {
                        Auth.instance.login(
                            phone.text, password.text, widget.role, context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 35.0),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont\'t have an account?',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.offAll(() => Signup_Screen(
                                  role: widget.role,
                                ));
                          },
                          child: const Text(
                            'Sign Up here',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 173, 109, 45)),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
