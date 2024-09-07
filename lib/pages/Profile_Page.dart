import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('User Profile',
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