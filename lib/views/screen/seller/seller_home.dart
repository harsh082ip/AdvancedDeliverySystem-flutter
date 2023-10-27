import 'dart:developer';

import 'package:advanced_delivery_system/controllers/fetch_products.dart';
import 'package:advanced_delivery_system/views/screen/seller/add_products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../widgets/custom_list_tile.dart';

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
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 173, 109, 45),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 173, 109, 45),
        onPressed: () {
          Get.to(Add_Products(
            currentUser: widget.currentuser,
          ));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: FetchProducts.fetchProductsforSeller(widget.currentuser),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text('No Products Added'),
              );
            }
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final item = documents[index].data() as Map<String, dynamic>;
                  return CustomListTile(
                    name: item['name of product'],
                    desc: item['description'],
                    imgUrl: item['image Url'],
                    price: item['price'],
                  );
                });
          }),
        ),
      ),
    );
  }
}
