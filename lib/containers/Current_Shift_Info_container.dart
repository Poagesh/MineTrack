import 'package:flutter/material.dart';

class CurrentShiftInfo extends StatelessWidget {
  final List<Map<String, String>> currentShifts = [
    {
      'Shift': 'Morning Shift',
      'Time': '6 AM - 2 PM',
      'Location': 'Western Pit',
      'Supervisor': 'John Doe',
    },
    {
      'Shift': 'Afternoon Shift',
      'Time': '2 PM - 10 PM',
      'Location': 'Eastern Pit',
      'Supervisor': 'Jane Smith',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 166, 166, 166),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(24.0),),
            child: const Text(
              'CURRENT SHIFT INFO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // Current shift details
          Column(
            children: currentShifts.map((shift) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shift: ${shift['Shift']}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Time: ${shift['Time']}'),
                      Text('Location: ${shift['Location']}'),
                      Text('Supervisor: ${shift['Supervisor']}'),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
