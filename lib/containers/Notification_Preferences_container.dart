import 'package:flutter/material.dart';

class NotificationPreferenceContainer extends StatefulWidget {
  @override
  _NotificationPreferenceContainerState createState() =>
      _NotificationPreferenceContainerState();
}

class _NotificationPreferenceContainerState
    extends State<NotificationPreferenceContainer> {
  List<String> notificationPreferences = [
    'Email notifications',
    'SMS notifications',
    'Push notifications',
  ];

  void _addNotificationPreference(String preference) {
    setState(() {
      notificationPreferences.add(preference);
    });
  }

  void _modifyNotificationPreference(int index, String newPreference) {
    setState(() {
      notificationPreferences[index] = newPreference;
    });
  }

  void _deleteNotificationPreference(int index) {
    setState(() {
      notificationPreferences.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 183, 183, 183),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 48, 48, 48),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'NOTIFICATION PREFERENCE',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          // Dynamically render each notification preference
          if (notificationPreferences.isNotEmpty)
            ...notificationPreferences.asMap().entries.map((entry) {
              int index = entry.key;
              String preference = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 174, 174, 174).withOpacity(0.5),
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
                          preference,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Color.fromARGB(255, 255, 145, 0)),
                            onPressed: () {
                              _modifyNotificationPreference(index, 'New Preference');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Color.fromARGB(255, 255, 145, 0)),
                            onPressed: () => _deleteNotificationPreference(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

          if (notificationPreferences.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No notification preferences set.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),

          // Button to add a new notification preference
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 145, 0),
            ),
            onPressed: () {
              _addNotificationPreference('New Preference');
            },
            child: Text('Add Notification Preference'),
          ),
        ],
      ),
    );
  }
}
