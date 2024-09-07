import 'package:flutter/material.dart';

class LogEntriesContainer extends StatefulWidget {
  @override
  _LogEntriesContainerState createState() => _LogEntriesContainerState();
}

class _LogEntriesContainerState extends State<LogEntriesContainer> {
  List<String> logs = [
    'Shift started at 8:00 AM.',
    'Equipment inspection completed at 9:30 AM.',
    'Minor breakdown in Conveyor Belt #2 at 11:00 AM.',
  ];

  bool _isAddingLog = false;
  TextEditingController _logController = TextEditingController();

  void _addLog(String log) {
    setState(() {
      logs.add(log);
      _isAddingLog = false;
      _logController.clear();
    });
  }

  void _removeLog(int index) {
    setState(() {
      logs.removeAt(index);
    });
  }

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
              borderRadius: BorderRadius.circular(24.0),),
            child: Text(
              'LOG ENTRIES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          // Dynamically render each log entry with a remove button
          if (logs.isNotEmpty)
            ...logs.asMap().entries.map((entry) {
              int index = entry.key;
              String log = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
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
                          log,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeLog(index),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

          if (logs.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No logs available.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),

          // Button to add a new log entry
          SizedBox(height: 10.0),
          if (_isAddingLog)
            Column(
              children: [
                TextField(
                  controller: _logController,
                  decoration: InputDecoration(
                    hintText: 'Enter log details...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    if (_logController.text.isNotEmpty) {
                      _addLog(_logController.text);
                    }
                  },
                  child: Text('Save Log'),
                ),
              ],
            ),
          if (!_isAddingLog)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAddingLog = true;
                });
              },
              child: Text('Add Log'),
            ),
        ],
      ),
    );
  }
}
