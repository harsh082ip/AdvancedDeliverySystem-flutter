import 'package:advanced_delivery_system/controllers/fetch_products.dart';
import 'package:advanced_delivery_system/views/widgets/ordered_products_section_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderedProducts extends StatefulWidget {
  String currentUser;
  OrderedProducts({super.key, required this.currentUser});

  @override
  State<OrderedProducts> createState() => _OrderedProductsState();
}

class _OrderedProductsState extends State<OrderedProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 173, 109, 45),
        title: Text('Your Items'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FetchProducts.fetchForOrderedProductsSection(widget.currentUser),
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
                  return OrderedProductsSectionTile(
                      prod_id: item['product id'],
                      imgUrl: item['image Url'],
                      cost_id: widget.currentUser,
                      price: item['price'],
                      prod_name: item['name of product'],
                      prod_desc: item['description']);
                });
          }),
        ),
      ),
    );
  }
}
