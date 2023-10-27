import 'dart:developer';
import 'dart:io';

import 'package:advanced_delivery_system/controllers/image_pick_controller.dart';
import 'package:advanced_delivery_system/controllers/upload_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_Products extends StatefulWidget {
  String currentUser;
  Add_Products({super.key, required this.currentUser});

  @override
  State<Add_Products> createState() => _Add_ProductsState();
}

class _Add_ProductsState extends State<Add_Products> {
  File? imgpath;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Products'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 173, 109, 45),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  Get.defaultDialog(
                      title: 'Please wait...',
                      content: const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 173, 109, 45),
                        ),
                      ));
                  log('Pressed');
                  final newImgPath = await Image_Picker.pickFile();
                  if (newImgPath != null) {
                    setState(() {
                      imgpath = File(newImgPath.path);
                      log(imgpath.toString());
                    });
                    Navigator.pop(context);
                  } else {}
                },
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.yellowAccent,
                      border: Border.all(color: Colors.black)),
                  margin:
                      EdgeInsets.symmetric(horizontal: 25).copyWith(top: 25),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: imgpath != null
                      ? Image.file(
                          imgpath!,
                          fit: BoxFit.cover,
                        )
                      : const Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 45,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 25.0).copyWith(top: 30.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black)),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0)
                          .copyWith(top: 5.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Name of Product',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0)
                          .copyWith(top: 5.0),
                      // width: 105,
                      // Set a maximum height for the description field
                      constraints: BoxConstraints(
                          maxHeight: 115), // Adjust the maxHeight as needed
                      child: TextFormField(
                        textInputAction: TextInputAction.newline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Description',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0)
                    .copyWith(top: 40.0),
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black)),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Price: INR',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 100.0),
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 173, 109, 45),
                  ),
                  onPressed: () async {
                    Get.defaultDialog(
                        content: Center(
                      child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 173, 109, 45)),
                    ));
                    if (imgpath != null &&
                        nameController.text.isNotEmpty &&
                        descController.text.isNotEmpty &&
                        priceController.text.isNotEmpty) {
                      Upload_Products.uploadProfilePic(
                          imgpath!.path, context, widget.currentUser);
                    }
                    log(imgpath!.path);

                    log(widget.currentUser);
                  },
                  child: Text(
                    'Add Products',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
