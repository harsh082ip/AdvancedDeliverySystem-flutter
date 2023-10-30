import 'package:advanced_delivery_system/views/screen/admin/generate_user_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 173, 109, 45)),
                accountName: Text('Bhupendra Jogi'),
                accountEmail: Text('BhupendrajogiAmerica@gmail.com')),
            ListTile(
              onTap: () {
                Get.to(() => GenerateUserkeys());
              },
              leading: Icon(
                Icons.key,
                size: 25.0,
              ),
              title: Text(
                'Generate User Keys',
                style: TextStyle(fontSize: 18.0),
              ),
              tileColor: Colors.white,
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 173, 109, 45),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text('Nothing to show'),
        ),
      ),
    );
  }
}
