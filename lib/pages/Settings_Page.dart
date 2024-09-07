import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Settings',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 170, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 128, 0)),
        elevation: 0,
      ),
    );
  }
}
