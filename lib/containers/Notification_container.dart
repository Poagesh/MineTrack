import 'package:flutter/material.dart';

class NotificationContainer extends StatefulWidget {
  @override
  _NotificationContainerState createState() => _NotificationContainerState();
}

class _NotificationContainerState extends State<NotificationContainer> {
  List<String> notifications = [
    'Coal mine inspection scheduled for tomorrow at 9 AM.',
    'New safety protocols implemented in the eastern pit.',
    'Maintenance work on Conveyor Belt #3 on August 25th.',
    'Emergency drill planned for September 1st.',
  ];

  void _addNotification(String notification) {
    setState(() {
      notifications.add(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 166, 166, 166),
        borderRadius: BorderRadius.circular(24.0), // Outer container border radius
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
              borderRadius: BorderRadius.circular(24.0), // Header border radius matching outer container
            ),
            child: Text(
              'NOTIFICATIONS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          // Dynamically render each notification
          if (notifications.isNotEmpty)
            ...notifications.map((notification) => Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0), // Each notification box border radius
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
                  notification,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )).toList(),

          if (notifications.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No notifications available.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),

          // Button to add a new notification
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              _addNotification('New notification: Safety equipment check on September 5th.');
            },
            child: Text('Add Notification'),
          ),
        ],
      ),
    );
  }
}
