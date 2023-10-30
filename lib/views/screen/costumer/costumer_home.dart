import 'dart:developer';

import 'package:advanced_delivery_system/controllers/fetch_products.dart';
import 'package:advanced_delivery_system/views/screen/costumer/ordered_products.dart';
import 'package:advanced_delivery_system/views/widgets/product_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              onTap: () {
                Get.to(() => OrderedProducts(
                      currentUser: widget.currentuser,
                    ));
              },
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
          stream: FetchProducts.fetchProductsforCostumer(widget.currentuser),
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
            // List<String> orderedByList = documents.map((doc) {
            //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            //   // Assuming 'ordered by' might be a List or a different type
            //   // You can handle different types or scenarios here accordingly
            //   dynamic orderedBy = data['ordered by'];

            //   if (orderedBy is String) {
            //     return orderedBy as String;
            //   } else {
            //     // Handle the case when 'ordered by' is not a String
            //     // For instance, converting a List to a comma-separated String
            //     if (orderedBy is List) {
            //       return orderedBy.join(
            //           ', '); // Join list elements as a comma-separated string
            //     } else {
            //       return ''; // Or handle it based on your specific use case
            //     }
            //   }
            // }).toList();
            // log('ordered by list: ' + orderedByList.toString());
            // if (orderedByList.contains(widget.currentuser)) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );`
            // }
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: documents.length,
                itemBuilder: ((context, index) {
                  final item = documents[index].data() as Map<String, dynamic>;
                  List<dynamic> ordered_by = item['ordered by'];
                  if (ordered_by.contains(widget.currentuser)) {
                    return ProductTile(
                      imgUrl: item['image Url'],
                      prod_id: item['product id'],
                      prod_name: item['name of product'],
                      prod_desc: item['description'],
                      cost_id: widget.currentuser,
                      ordered_by: 'yes',
                      price: item['price'],
                    );
                  } else {
                    return ProductTile(
                      imgUrl: item['image Url'],
                      prod_id: item['product id'],
                      prod_name: item['name of product'],
                      prod_desc: item['description'],
                      cost_id: widget.currentuser,
                      ordered_by: 'no',
                      price: item['price'],
                    );
                  }
                }));
          }),
        ),
      ),
    );
  }
}
