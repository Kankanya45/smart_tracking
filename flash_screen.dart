import 'package:flutter/material.dart';
import 'package:smarttracking/login_screen.dart';

class FlashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smart Tracker',
          style: TextStyle(
              color: const Color.fromARGB(
                  255, 255, 255, 255)), // Set the text color
        ),
        backgroundColor: Color.fromARGB(255, 254, 123, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 49, 83, 99),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('images/smart.png'),
                width: 450.0,
                height: 450.0,
              ),
              SizedBox(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(300, 50),
                    side: BorderSide(
                      color: Color.fromARGB(255, 254, 123, 1),
                      width: 2.0,
                    ),
                    backgroundColor: Color.fromARGB(255, 254, 123, 1),
                  ),
                  child: Text(
                    'เริ่มใช้งาน',
                    style: TextStyle(
                      color: Color.fromARGB(255, 254, 254, 254),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
