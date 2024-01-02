import 'package:flutter/material.dart';
import 'package:smarttracking/menu.dart';

class MenuHealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Health'),
        backgroundColor: Color.fromARGB(255, 254, 123, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 49, 83, 99),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HealthButton(
              label: 'Heartbeat',
              iconPath: 'images/heartbeat_icon.png',
              onTap: () {
                // Handle Heartbeat button tap
                Navigator.pushNamed(context, '/heartbeat');
              },
            ),
            SizedBox(height: 20),
            HealthButton(
              label: 'Temperature',
              iconPath: 'images/temperature_icon.png',
              onTap: () {
                // Handle Temperature button tap
                Navigator.pushNamed(context, '/temperature');
              },
            ),
            SizedBox(height: 20),
            HealthButton(
              label: 'Pressure',
              iconPath: 'images/pressure_icon.png',
              onTap: () {
                // Handle Pressure button tap
                Navigator.pushNamed(context, '/pressure');
              },
            ),
            SizedBox(height: 20),
            HealthButton(
              label: 'Sleep',
              iconPath: 'images/sleep_icon.png',
              onTap: () {
                // Handle Sleep button tap
                Navigator.pushNamed(context, '/sleep');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HealthButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  HealthButton({
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white, // You can change the background color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: Colors.black, // You can change the text color
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
