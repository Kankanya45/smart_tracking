import 'package:flutter/material.dart';
import 'package:smarttracking/menu.dart';
import 'package:smarttracking/menu.dart';

class PhonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Phone'),
        backgroundColor: Color.fromARGB(255, 254, 123, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 49, 83, 99),
      body: Center(
        child: Image.asset(
          'images/phone1.png', // Replace with the path to your image
          width: 300.0,
          height: 300.0,
          fit: BoxFit.cover, // Adjust the BoxFit as needed
        ),
      ),
    );
  }
}
