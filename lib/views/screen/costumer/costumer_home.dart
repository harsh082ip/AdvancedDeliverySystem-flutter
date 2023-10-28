import 'dart:developer';

import 'package:advanced_delivery_system/controllers/fetch_products.dart';
import 'package:advanced_delivery_system/views/widgets/product_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CostumerHome extends StatefulWidget {
  String currentuser;
  CostumerHome({super.key, required this.currentuser});

  @override
  State<CostumerHome> createState() => _CostumerHomeState();
}

class _CostumerHomeState extends State<CostumerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 173, 109, 45)),
                accountName: Text(''),
                accountEmail: Text('')),
            ListTile(
              leading: Icon(
                Icons.production_quantity_limits,
                size: 25.0,
              ),
              title: Text(
                'Your Orders',
                style: TextStyle(fontSize: 18.0),
              ),
              tileColor: Colors.white,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Color.fromARGB(255, 173, 109, 45),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream: FetchProducts.fetchProductsforCostumer(),
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
                physics: BouncingScrollPhysics(),
                itemCount: documents.length,
                itemBuilder: ((context, index) {
                  final item = documents[index].data() as Map<String, dynamic>;
                  return ProductTile(
                    imgUrl: item['image Url'],
                    prod_id: item['product id'],
                    prod_name: item['name of product'],
                    prod_desc: item['description'],
                  );
                }));
          }),
        ),
      ),
    );
  }
}
