import 'dart:developer';

import 'package:advanced_delivery_system/models/users.dart';
import 'package:advanced_delivery_system/views/screen/Auth/otp_page.dart';
import 'package:advanced_delivery_system/views/screen/costumer/costumer_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Auth extends GetxController {
  static Auth instance = Get.find();
  final TextEditingController textController = TextEditingController();
  var receivedID = '';
  void signUp(String name, String password, String role, String phone_no,
      BuildContext context, bool isLoading) async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');

    collectionReference
        .where('phone_no', isEqualTo: phone_no)
        .get()
        .then((QuerySnapshot snapshot) async {
      if (snapshot.docs.isEmpty) {
        try {
          log('in signup func');
          String fullNo = '+91' + phone_no;
          log(phone_no);
          if (phone_no.isNotEmpty && name.isNotEmpty && password.isNotEmpty) {
            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: fullNo,
              verificationCompleted: (PhoneAuthCredential credential) {
                FirebaseAuth.instance
                    .signInWithCredential(credential)
                    .then((value) => Get.offAll(CostumerHome()));
              },
              timeout: Duration(seconds: 120),
              verificationFailed: (FirebaseAuthException e) {
                Get.snackbar(e.toString(), '');
                log(e.toString());
              },
              codeSent: (String verificationId, int? resendToken) {
                receivedID = verificationId;
                // Get.to(() => Otp_Page(
                //       receivedID: receivedID,
                //     ));
                isLoading = false;
                Get.defaultDialog(
                    title: 'OTP',
                    content: Column(
                      children: [
                        TextFormField(
                          controller: textController,
                        ),
                      ],
                    ),
                    confirm: ElevatedButton(
                      onPressed: () {
                        verifyOTPCode(receivedID, textController.text, name,
                            phone_no, password, role, context);
                      },
                      child: Text('Confirm'),
                    ),
                    cancel: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')));
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          } else {
            Get.snackbar('Missing Details', '');
            Navigator.pop(context);
          }
        } catch (e) {
          Get.snackbar('Error', e.toString());
        }
      } else {
        Get.snackbar('User already exists', 'Please Login');
      }
    });
  }

  Future<void> verifyOTPCode(
      String receivedID,
      String otp,
      String name,
      String phone_no,
      String password,
      String role,
      BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID,
        smsCode: otp,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the sign-in was successful and the user is not null.
      if (userCredential.user != null) {
        MyUser user = MyUser(
            name: name,
            phone_no: phone_no,
            password: password,
            role: role,
            uid: FirebaseAuth.instance.currentUser!.uid);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(user.toJson())
            .then((value) {
          log('SignIn Success');
          Get.offAll(CostumerHome());
          log(userCredential.user!.uid + "yoyooyo");
        });

        log('SignIn Success');
        Get.offAll(CostumerHome());
        log(userCredential.user!.uid + "yoyooyo");
      } else {
        Get.defaultDialog(
            title: 'Something went wrong',
            content: Text('Wrong OTP entered'),
            confirm: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Confirm')));
        log('SignIn failed'); // Handle the case where the sign-in failed.
      }
    } catch (e) {
      log('Error during sign-in: $e');
      Get.snackbar('Error',
          e.toString()); // Handle any errors that occur during the sign-in process.
    }
  }
}
