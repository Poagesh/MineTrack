import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:minetrack/containers/Data_Security_container.dart';
import 'package:minetrack/containers/ERP_container.dart';
import 'package:minetrack/containers/Notification_Preferences_container.dart';
import 'package:minetrack/containers/User_Management_container.dart';
import 'package:minetrack/navigations/drawer_nav.dart';

class IntegrationPage extends StatefulWidget {
  const IntegrationPage({super.key});

  @override
  _IntegrationPage createState() => _IntegrationPage();
}

class _IntegrationPage extends State<IntegrationPage> {
  

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        
      });
    }
  }


  void _saveChanges() {
    // Implement save changes functionality here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Changes Saved')));
  }

  void _submitChanges() {
    // Implement submit changes functionality here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Changes Submitted')));
  } @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'INTEGRATION',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 170, 0),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 128, 0)),
        elevation: 0,
      ),
      drawer: const CustomDrawer(), // Use the CustomDrawer widget
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                UserManagementContainer(),
                const SizedBox(height: 20),
                ERPContainer(),
                const SizedBox(height: 20),
                DataSecurityContainer(),
                const SizedBox(height: 20),
                NotificationPreferenceContainer(),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _saveChanges,
                      child: Text('Save Changes'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color.fromARGB(255, 255, 128, 0), 
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _submitChanges,
                      child: Text('Cancel Changes'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  Color.fromARGB(255, 255, 128, 0), 
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

 