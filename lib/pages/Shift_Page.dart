import 'package:flutter/material.dart';
import 'package:minetrack/containers/Notification_container.dart';
import 'package:minetrack/containers/Shift_Info_container.dart';
import 'package:minetrack/navigations/drawer_nav.dart';

class ShiftPage extends StatelessWidget {
  const ShiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'MINE TRACK',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 170, 0),
              fontSize: 40,
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
                NotificationContainer(),
                const SizedBox(height: 20),
                ShiftInfo(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
