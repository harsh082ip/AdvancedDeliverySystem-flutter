import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  String imgUrl;
  String name;
  String desc;
  String price;
  CustomListTile(
      {super.key,
      required this.name,
      required this.desc,
      required this.imgUrl,
      required this.price});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(top: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), color: Colors.grey[350]),
      child: ListTile(
        leading: Image.network(widget.imgUrl),
        title: Text(widget.name),
        subtitle: Text(widget.desc),
        trailing: Text(
          'Rs. ' + widget.price,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
