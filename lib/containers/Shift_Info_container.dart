import 'package:flutter/material.dart';

class ShiftInfo extends StatefulWidget {
  @override
  _ShiftInfoState createState() => _ShiftInfoState();
}

class _ShiftInfoState extends State<ShiftInfo> {
  List<String> currentShifts = [
    'Morning Shift: 6 AM - 2 PM, Team A',
    'Afternoon Shift: 2 PM - 10 PM, Team B',
  ];

  List<String> upcomingShifts = [
    'Night Shift: 10 PM - 6 AM, Team C',
    'Morning Shift: 6 AM - 2 PM, Team D (Tomorrow)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 166, 166, 166),
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'SHIFT INFO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          // Current Shifts
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CURRENT SHIFTS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 166, 0),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                ...currentShifts.map((shift) => Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      shift,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )).toList(),
              ],
            ),
          ),
          SizedBox(height: 10.0),

          // Upcoming Shifts
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UPCOMING SHIFTS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 166, 0),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                ...upcomingShifts.map((shift) => Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      shift,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
