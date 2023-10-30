import 'package:advanced_delivery_system/controllers/codes_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenerateUserkeys extends StatefulWidget {
  const GenerateUserkeys({super.key});

  @override
  State<GenerateUserkeys> createState() => _GenerateUserkeysState();
}

class _GenerateUserkeysState extends State<GenerateUserkeys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 173, 109, 45),
        ),
        body: Center(
          child: Container(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 173, 109, 45)),
              onPressed: () {
                Get.defaultDialog(
                    title: 'Generating...',
                    content: const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color.fromARGB(255, 173, 109, 45),
                      ),
                    ));
                CodesController.genIdAndCodes();
              },
              child: const Text(
                'Generate New User keys',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ));
  }
}
