import 'dart:developer';

import 'package:advanced_delivery_system/views/screen/costumer/add_products.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class CostumerHome extends StatefulWidget {
  String currentuser;
  CostumerHome({super.key, required this.currentuser});

  @override
  State<CostumerHome> createState() => _CostumerHomeState();
}

class _CostumerHomeState extends State<CostumerHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log(widget.currentuser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 173, 109, 45),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 173, 109, 45),
        onPressed: () {
          Get.to(Add_Products(
            currentUser: widget.currentuser,
          ));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
