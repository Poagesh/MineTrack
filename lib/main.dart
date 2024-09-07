import 'package:flutter/material.dart';
import 'package:minetrack/pages/Login_Page.dart';
import 'package:minetrack/pages/Shift_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShiftPage(),
      theme: ThemeData(
        primaryColor: Colors.orange,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 149, 0), 
            foregroundColor: Color.fromARGB(255, 255, 255, 255), 
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color.fromARGB(255, 43, 43, 43)), 
          bodyMedium: TextStyle(color: Color.fromARGB(255, 45, 45, 45)), 
          headlineLarge: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          headlineMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 255, 136, 0)), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIconColor: Color.fromARGB(255, 255, 255, 255), 
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 140, 0)), 
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

