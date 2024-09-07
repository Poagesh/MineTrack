import 'package:flutter/material.dart';
import 'package:minetrack/containers/Control_Measures_containers.dart';
import 'package:minetrack/containers/Hazard_List.dart';
import 'package:minetrack/containers/Responsibility_container.dart';
import 'package:minetrack/containers/Review_and_Audit_Logs_container.dart';
import 'package:minetrack/navigations/drawer_nav.dart';

class SmpPage extends StatefulWidget {
  const SmpPage({super.key});

  @override
  State<SmpPage> createState() => _SmpPageState();
}

class _SmpPageState extends State<SmpPage> {

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
                ListOfHazardsContainer(),
                const SizedBox(height: 20),
                ControlMeasuresContainer(),
                const SizedBox(height: 20),
                ResponsibilitiesContainer(),
                const SizedBox(height: 20),
                ReviewAuditLogsContainer(),
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
