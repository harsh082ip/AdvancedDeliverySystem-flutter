import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Upload_Products {
  static void uploadProfilePic(
      String imgPath, BuildContext context, String currentuser) async {
    final file = File(imgPath);
    String filename = basename(file.path);
    log(filename);
    try {
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('Users/$currentuser/$filename');
      final UploadTask uploadTask = storageRef.putFile(file);
      String? dwnURL;
      await uploadTask.whenComplete(() async {
        final downloadURL = await storageRef.getDownloadURL();
        dwnURL = downloadURL;
        log('Profile uploaded to: $downloadURL');
      });
      Navigator.pop(context);

      // User_Profile_Pic upp = User_Profile_Pic(
      //     name: name,
      //     nickName: nickname,
      //     profile_url: dwnURL.toString(),
      //     uid: FirebaseAuth.instance.currentUser!.uid);

      // await FirebaseFirestore.instance
      //     .collection('Profile_Pics')
      //     .doc(FirebaseAuth.instance.currentUser!.uid)
      //     .set(upp.toJson())
      //     .then((value) {
      //   Get.offAll(HomeScreen());
      // });
    } catch (e) {
      Navigator.pop(context);
      print('Error uploading pic: $e');
      return null;
    }
  }
}
