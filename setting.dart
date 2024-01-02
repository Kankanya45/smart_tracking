import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class settingPage extends StatefulWidget {
  @override
  _settingPageState createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  TextEditingController _imeiController = TextEditingController();
  TextEditingController _deviceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromARGB(255, 254, 123, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 49, 83, 99),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _imeiController,
              decoration: InputDecoration(labelText: 'IMEI Number'),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _deviceNameController,
              decoration: InputDecoration(labelText: 'Device Name'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _updateSettings();
              },
              child: Text('บันทึกการตั้งค่า'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 50),
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateSettings() async {
    final apiUrl = 'http://localhost/api_tracking/setting.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'imei_no': _imeiController.text,
          'device_name': _deviceNameController.text,
        },
      );

      if (response.statusCode == 200) {
        _showSnackBar('Settings updated successfully');
      } else {
        _showSnackBar('Failed to update settings');
      }
    } catch (e) {
      print('Error: $e');
      _showSnackBar('Error occurred while updating settings');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
