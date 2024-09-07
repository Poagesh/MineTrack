import 'package:flutter/material.dart';

class ResponsibilitiesContainer extends StatefulWidget {
  @override
  _ResponsibilitiesContainerState createState() =>
      _ResponsibilitiesContainerState();
}

class _ResponsibilitiesContainerState
    extends State<ResponsibilitiesContainer> {
  List<Map<String, String>> tasks = [
    {'title': 'Inspect ventilation system', 'status': 'Ongoing'},
    {'title': 'Check safety equipment', 'status': 'Completed'},
  ];

  void _addTask(String title) {
    setState(() {
      tasks.add({'title': title, 'status': 'Ongoing'});
    });
  }

  void _editTask(int index, String newTitle) {
    setState(() {
      tasks[index]['title'] = newTitle;
    });
  }

  void _endTask(int index) {
    setState(() {
      tasks[index]['status'] = 'Completed';
    });
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header for Responsibilities
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'RESPONSIBILITIES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          // Task List
          if (tasks.isNotEmpty)
            ...tasks.asMap().entries.map((entry) {
              int index = entry.key;
              String title = entry.value['title']!;
              String status = entry.value['status']!;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
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
                          '$title ($status)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue[900]),
                            onPressed: () {
                              _editTask(index, 'New Task Title');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.done, color: Colors.green[900]),
                            onPressed: () => _endTask(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red[900]),
                            onPressed: () => _removeTask(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

          if (tasks.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No tasks assigned yet.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),

          // Button to add a new task
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 119, 0),
            ),
            onPressed: () {
              _addTask('New Task');
            },
            child: Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
