import 'package:flutter/material.dart';
import 'dart:js';
import 'package:smarttracking/register.dart';
import 'package:smarttracking/menu.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เข้าสู่ระบบ',
          style: TextStyle(
            color:
                const Color.fromARGB(255, 255, 255, 255), // Set the text color
          ),
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
                image: AssetImage(
                    'images/smart.png'), // เปลี่ยนเป็นที่อยู่ของรูปภาพที่คุณใช้
                width: 400.0, // ก าหนดความกว้าง
                height: 400.0, // ก าหนดความสูง
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.white), // Set the input text color
                decoration: InputDecoration(
                  labelText: 'ชื่อผู้ใช้',
                  labelStyle: TextStyle(
                      color: Colors.white), // Set the label text color
                ),
              ),
              TextFormField(
                style:
                    TextStyle(color: Colors.white), // Set the input text color
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  labelStyle: TextStyle(
                      color: Colors.white), // Set the label text color
                ),
                obscureText: true, // ซ่อนข้อความในรหัสผ่าน
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyMenuPage()),
                  );
                },
                child: Text('เข้าสู่ระบบ'),
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  side: BorderSide(
                    color: Color.fromARGB(255, 254, 123, 1),
                    width: 2.0,
                  ),
                  backgroundColor: Color.fromARGB(255, 254, 123, 1),
                ),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  // เพิ่มการไปหน้าสร้างผู้ใช้ที่นี่
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => RegisterUserForm(),
                  ));
                },
                child: Text(
                  'ลงทะเบียนผู้ใช้ใหม่',
                  style: TextStyle(color: Colors.white), // Set the text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
