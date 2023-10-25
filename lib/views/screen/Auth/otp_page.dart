import 'dart:developer';

import 'package:advanced_delivery_system/controllers/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Otp_Page extends StatefulWidget {
  String receivedID;
  Otp_Page({super.key, required this.receivedID});

  @override
  State<Otp_Page> createState() => _Otp_PageState();
}

class _Otp_PageState extends State<Otp_Page> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController otp = TextEditingController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: otp,
            ),
            ElevatedButton(
              onPressed: () {
                // Auth.instance.verifyOTPCode(widget.receivedID, otp.text, context);
              },
              child: Text('varify'),
            ),
          ],
        ),
      ),
    );
  }
}
