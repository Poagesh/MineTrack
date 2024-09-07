import 'package:flutter/material.dart';

class ReviewAuditLogsContainer extends StatefulWidget {
  @override
  _ReviewAuditLogsContainerState createState() => _ReviewAuditLogsContainerState();
}

class _ReviewAuditLogsContainerState extends State<ReviewAuditLogsContainer> {
  final TextEditingController _logController = TextEditingController();
  List<String> logs = [];

  void _addLog() {
    setState(() {
      logs.add(_logController.text);
      _logController.clear();
    });
  }

  void _editLog(int index, String newLog) {
    setState(() {
      logs[index] = newLog;
    });
  }

  void _deleteLog(int index) {
    setState(() {
      logs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 214, 214, 214),
        borderRadius: BorderRadius.circular(24.0),
      ),
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
              'REVIEW & AUDIT LOGS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),

          // Log Entry List
          ListView.builder(
            shrinkWrap: true,
            itemCount: logs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(logs[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.orange),
                      onPressed: () {
                        _editLog(index, "Edited Log"); // Replace with actual edit logic
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.orange),
                      onPressed: () => _deleteLog(index),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 20.0),

          // Add Log Section
          TextField(
            controller: _logController,
            decoration: InputDecoration(
              hintText: 'Enter log details...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            ),
          ),
          SizedBox(height: 20.0),

          // Save Button
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              ),
              onPressed: _addLog,
              child: Text(
                'Save Log',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
