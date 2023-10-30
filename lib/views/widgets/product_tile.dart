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
  String cost_id;
  String ordered_by;
  String price;
  ProductTile(
      {super.key,
      required this.prod_id,
      required this.imgUrl,
      required this.prod_name,
      required this.prod_desc,
      required this.cost_id,
      required this.ordered_by,
      required this.price});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 15.0, top: 12.0),
              child: Text(
                'Rs. ' + widget.price,
                style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 150,
              height: 40.0,
              margin:
                  const EdgeInsets.only(top: 20.0, right: 15.0, bottom: 15.0),
              child: widget.ordered_by == 'yes'
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      onPressed: () {},
                      child: const Text('Item Ordered'))
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 173, 109, 45)),
                      onPressed: () {
                        Get.defaultDialog(
                            title: 'Are you sure you want to buy this item',
                            cancel: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 173, 109, 45)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            confirm: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 173, 109, 45)),
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: 'Please wait...',
                                      content: const Center(
                                        child: CircularProgressIndicator(
                                          color:
                                              Color.fromARGB(255, 173, 109, 45),
                                        ),
                                      ));
                                  Orders.orderByCostumer(
                                      widget.prod_id,
                                      ProductOTPGenerator.generateOTP(),
                                      context,
                                      widget.cost_id);
                                  // Navigator.pop(context);
                                },
                                child: const Text('Confirm')));
                      },
                      child: const Text(
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
