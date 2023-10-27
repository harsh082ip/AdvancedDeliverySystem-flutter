import 'package:advanced_delivery_system/views/screen/Auth/login_screen.dart';
import 'package:advanced_delivery_system/views/screen/Auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Color.fromARGB(255, 173, 109, 45),
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 173, 109, 45),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45.0),
                      bottomRight: Radius.circular(45.0))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 120.0),
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Welcome to ADS',
                    style: TextStyle(
                        fontSize: 34.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'Discover Content as a',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreen(
                          role: 'seller',
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            color: Color.fromARGB(255, 197, 194, 194)),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/admin.png',
                              height: 150,
                              width: 150,
                            ),
                            const Text(
                              'seller',
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreen(role: 'costumer'));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0).copyWith(left: 0),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            color: Color.fromARGB(255, 197, 194, 194)),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/costumer.png',
                              height: 150,
                              width: 150,
                            ),
                            const Text(
                              'Costumer',
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15.0).copyWith(top: 0),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Color.fromARGB(255, 197, 194, 194)),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/delivery.png',
                            height: 150,
                            width: 150,
                          ),
                          const Text(
                            'Delivery Agent',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
