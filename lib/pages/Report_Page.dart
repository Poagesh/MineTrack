import 'package:flutter/material.dart';
import 'package:minetrack/containers/Report_Criteria_container.dart';
import 'package:minetrack/containers/Report_Mailing_container.dart';
import 'package:minetrack/navigations/drawer_nav.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
 @override
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
               ReportGenerationCriteria(),
                const SizedBox(height: 20),
                Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 153, 0),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              ),
              onPressed: () => (context),
              child: Text(
                'Generate Report',
                style: TextStyle(fontSize: 18.0),
                ),
            )
            ),
                
                const SizedBox(height: 20),

            Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 153, 0),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              ),
              onPressed: () => (context),
              child: Text(
                'Preview Report',
                style: TextStyle(fontSize: 18.0),
                ),
            )
            ),

                
                const SizedBox(height: 20),
                ForwardReportContainer(),
                 const SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
