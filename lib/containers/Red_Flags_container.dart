import 'package:flutter/material.dart';

class RedFlagsContainer extends StatefulWidget {
  @override
  _RedFlagsContainerState createState() => _RedFlagsContainerState();
}

class _RedFlagsContainerState extends State<RedFlagsContainer> {
  List<String> redFlags = [
    'High methane levels detected in the southern tunnel.',
    'Structural instability in the western shaft.',
    'Faulty ventilation system in the main pit.',
  ];

  void _addRedFlag(String flag) {
    setState(() {
      redFlags.add(flag);
    });
  }

  void _removeRedFlag(int index) {
    setState(() {
      redFlags.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[100],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: BorderRadius.circular(24.0),),
              child: Text(
              'RED FLAGS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          // Dynamically render each red flag
          if (redFlags.isNotEmpty)
            ...redFlags.asMap().entries.map((entry) {
              int index = entry.key;
              String flag = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          flag,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red[900]),
                        onPressed: () => _removeRedFlag(index),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

          if (redFlags.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No red flags at the moment.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),

          // Button to add a new red flag
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[900], // Set button color here
            ),
            onPressed: () {
              _addRedFlag('New red flag: Inspect for potential gas leakage in the eastern pit.');
            },
            child: Text('Add Red Flag'),
          ),
        ],
      ),
    );
  }
}
