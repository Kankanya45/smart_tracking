import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HealthSavePage extends StatefulWidget {
  @override
  _HealthSavePageState createState() => _HealthSavePageState();
}

class _HealthSavePageState extends State<HealthSavePage> {
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _titlenameController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _heartValueController = TextEditingController();
  TextEditingController _pulseValueController = TextEditingController();

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      // Format the selected date and update the controller
      String formattedDate = "${picked.day}/${picked.month}/${picked.year}";
      _dobController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Health Data'),
        backgroundColor: Color.fromARGB(255, 254, 123, 1),
      ),
      backgroundColor: const Color.fromARGB(255, 49, 83, 99),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextField(_idCardController, 'ID Card'),
            _buildTextField(_titlenameController, 'Title Name'),
            _buildTextField(_firstnameController, 'First Name'),
            _buildTextField(_lastnameController, 'Last Name'),
            _buildTextField(
              _dobController,
              'Date of Birth',
              onTap: () => _selectDate(context),
              readOnly: true,
            ),
            _buildTextField(_heartValueController, 'Heart Value'),
            _buildTextField(_pulseValueController, 'Pulse Value'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _saveHealthData();
                Navigator.pop(context);
              },
              child: Text('Save Health Data'),
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

  Widget _buildTextField(
    TextEditingController controller,
    String labelText, {
    Function()? onTap,
    bool readOnly = false,
  }) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          onTap: onTap,
          readOnly: readOnly,
          decoration: InputDecoration(labelText: labelText),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }

  Future<void> _saveHealthData() async {
    final idCard = _idCardController.text;
    final titlename = _titlenameController.text;
    final firstname = _firstnameController.text;
    final lastname = _lastnameController.text;
    final dob = _dobController.text;
    final heartValue = _heartValueController.text;
    final pulseValue = _pulseValueController.text;

    final apiUrl = 'http://localhost/api_tracking/healthSave.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'id_card': idCard,
          'titlename': titlename,
          'firstname': firstname,
          'lastname': lastname,
          'date_of_birth': dob,
          'heart_value': heartValue,
          'pulse_value': pulseValue,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Health data saved successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save health data')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred while saving health data')),
      );
    }
  }
}
