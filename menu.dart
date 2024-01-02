import 'package:flutter/material.dart';
import 'sos.dart';
import 'phone.dart';
import 'tracking.dart';
import 'menu_health.dart';
import 'setting.dart';
import 'userinfo.dart';
import 'healthSave.dart';

class MyMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MENU',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 254, 123, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 49, 83, 99),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MenuButton(
                  icon: Icons.sos,
                  label: 'SOS',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SosPage()),
                    );
                  },
                ),
                SizedBox(height: 16),
                MenuButton(
                  icon: Icons.phone,
                  label: 'Contact',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhonePage()),
                    );
                  },
                ),
                SizedBox(height: 16),
                MenuButton(
                  icon: Icons.gps_fixed,
                  label: 'Tracking',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrackingPage()),
                    );
                  },
                ),
                SizedBox(height: 16),
                MenuButton(
                  icon: Icons.local_hospital,
                  label: 'Menu Health',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuHealthPage()),
                    );
                  },
                ),
                SizedBox(height: 16),
                MenuButton(
                  icon: Icons.settings,
                  label: 'setting',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => settingPage()),
                    );
                  },
                ),
                SizedBox(height: 16),
                MenuButton(
                  icon: Icons.settings,
                  label: 'userinfo',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => userinfoPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  MenuButton({required this.icon, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
        color: const Color.fromARGB(255, 49, 83, 99),
      ),
      label: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 254, 123, 1),
        onPrimary: Colors.white,
        shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minimumSize: Size(200, 60),
      ),
    );
  }
}
