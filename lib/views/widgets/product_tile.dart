import 'package:advanced_delivery_system/controllers/orders.dart';
import 'package:advanced_delivery_system/views/widgets/otp_generator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductTile extends StatefulWidget {
  String prod_id;
  String imgUrl;
  String prod_name;
  String prod_desc;
  ProductTile(
      {super.key,
      required this.prod_id,
      required this.imgUrl,
      required this.prod_name,
      required this.prod_desc});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.symmetric(horizontal: 15.0).copyWith(top: 15.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.0, right: 8.0, bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Product ID: ',
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                ),
                Text(
                  widget.prod_id,
                  style: TextStyle(color: Colors.red, fontSize: 20.0),
                )
              ],
            ),
          ),
          Container(
            height: 280,
            child: Image.network(fit: BoxFit.cover, widget.imgUrl),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                widget.prod_name,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
            child: Text(
              widget.prod_desc,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 150,
              height: 40.0,
              margin: EdgeInsets.only(top: 20.0, right: 15.0, bottom: 15.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 173, 109, 45)),
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Are you sure you want to buy this item',
                        cancel: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 173, 109, 45)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel')),
                        confirm: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 173, 109, 45)),
                            onPressed: () {
                              Get.defaultDialog(
                                  title: 'Please wait...',
                                  content: Center(
                                    child: CircularProgressIndicator(
                                      color: Color.fromARGB(255, 173, 109, 45),
                                    ),
                                  ));
                              Orders.orderByCostumer(widget.prod_id,
                                  ProductOTPGenerator.generateOTP(), context);
                              // Navigator.pop(context);
                            },
                            child: Text('Confirm')));
                  },
                  child: Text(
                    'Buy',
                    style: TextStyle(fontSize: 25.0, letterSpacing: 2),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
