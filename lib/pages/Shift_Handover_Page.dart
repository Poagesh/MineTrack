import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Use file_picker instead of image_picker
import 'package:minetrack/containers/Current_Shift_Info_container.dart';
import 'package:minetrack/containers/Log_Entries_container.dart';
import 'package:minetrack/containers/Outgoing_Shift_Summary.dart';
import 'package:minetrack/containers/Red_Flags_container.dart';
import 'package:minetrack/navigations/drawer_nav.dart';

class ShiftHandoverPage extends StatefulWidget {
  const ShiftHandoverPage({super.key});

  @override
  _ShiftHandoverPageState createState() => _ShiftHandoverPageState();
}

class _ShiftHandoverPageState extends State<ShiftHandoverPage> {
  String? _selectedFileName;

  Future<void> _pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SHIFT HANDOVER',
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
                CurrentShiftInfo(),
                const SizedBox(height: 20),
                OutgoingShiftSummary(),
                const SizedBox(height: 20),
                LogEntriesContainer(),
                const SizedBox(height: 20),
                RedFlagsContainer(),
                const SizedBox(height: 20),

                // Upload Document Button
                ElevatedButton(
                  onPressed: _pickDocument,
                  child: Text('Upload Document'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color.fromARGB(255, 255, 128, 0),
                  ),
                ),
                if (_selectedFileName != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Selected file: $_selectedFileName'),
                  ),

                // Save and Submit Buttons
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
                      child: Text('Submit Changes'),
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
