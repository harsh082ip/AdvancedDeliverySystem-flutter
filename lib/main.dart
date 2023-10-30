import 'package:advanced_delivery_system/views/screen/admin/admin_home.dart';
import 'package:advanced_delivery_system/views/screen/landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/firebase_auth.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFireBase();
  runApp(const MyApp());
}

_initializeFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(Auth());
    print('firebase initialized');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Delivery System',
      home: LandingScreen(),
    );
  }
}
