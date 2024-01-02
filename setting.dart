import 'package:flutter/material.dart';
import 'package:smarttracking/menu.dart';

class settingPage extends StatefulWidget {
  @override
  _settingPageState createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  TextEditingController imeiController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: Color.fromARGB(255, 254, 123, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 49, 83, 99),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInputField('IMEI Number', imeiController),
            _buildInputField('Device Name', deviceNameController),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveSettings,
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

  Widget _buildInputField(String labelText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
      ),
    );
  }

  void saveSettings() {
    String imeiNumber = imeiController.text;
    String deviceName = deviceNameController.text;
    String apiUrl = 'http://localhost/api_tracking/setting.php';

    // Perform the logic to save the settings
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
          content: Text('Your settings have been successfully saved.'),
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
