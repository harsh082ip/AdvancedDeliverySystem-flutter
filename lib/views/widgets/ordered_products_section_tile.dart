import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderedProductsSectionTile extends StatefulWidget {
  String prod_id;
  String imgUrl;
  String prod_name;
  String prod_desc;
  String cost_id;
  // String ordered_by;
  String price;
  OrderedProductsSectionTile(
      {super.key,
      required this.prod_id,
      required this.imgUrl,
      required this.cost_id,
      required this.price,
      required this.prod_name,
      required this.prod_desc});

  @override
  State<OrderedProductsSectionTile> createState() =>
      _OrderedProductsSectionTileState();
}

class _OrderedProductsSectionTileState
    extends State<OrderedProductsSectionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 15.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0, right: 8.0, bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Product ID: ',
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                ),
                Text(
                  widget.prod_id,
                  style: const TextStyle(color: Colors.red, fontSize: 20.0),
                )
              ],
            ),
          ),
          SizedBox(
            height: 280,
            child: Image.network(fit: BoxFit.cover, widget.imgUrl),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                widget.prod_name,
                style: const TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
            child: Text(
              widget.prod_desc,
              style: const TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
