import 'package:flutter/material.dart';
import 'package:smarttracking/menu.dart';

class userinfoPage extends StatefulWidget {
  @override
  _userinfoPageState createState() => _userinfoPageState();
}

class _userinfoPageState extends State<userinfoPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Phone'),
        backgroundColor: Color.fromARGB(255, 254, 123, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 49, 83, 99),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInputField('Name', nameController),
            _buildInputField('Surname', surnameController),
            _buildInputField('Email', emailController),
            _buildInputField('Mobile', mobileController),
            _buildInputField('Password', passwordController),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveUserInfo,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Color.fromARGB(255, 254, 123, 1),
              ),
              child: Text(
                'Save',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller,
      {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      ),
    );
  }

  void saveUserInfo() {
    String name = nameController.text;
    String surname = surnameController.text;
    String email = emailController.text;
    String mobile = mobileController.text;
    String password = passwordController.text;

    // Perform the logic to save the user information
    // You can add your implementation here

    // Show a success message or navigate to another screen
    showSuccessDialog(context);
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Successfully'),
          content: Text('Your information has been successfully saved.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('บันทึกข้อมูล'),
            ),
          ],
        );
      },
    );
  }
}
