import 'package:flutter/material.dart';

class UserManagementContainer extends StatefulWidget {
  @override
  _UserManagementContainerState createState() => _UserManagementContainerState();
}

class _UserManagementContainerState extends State<UserManagementContainer> {
  List<Map<String, String>> users = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  int? _editingIndex;

  void _createOrUpdateUser() {
    String name = nameController.text;
    String role = roleController.text;

    if (name.isEmpty || role.isEmpty) {
      return;
    }

    if (_editingIndex == null) {
      // Create new user
      setState(() {
        users.add({'name': name, 'role': role});
      });
    } else {
      // Update existing user
      setState(() {
        users[_editingIndex!] = {'name': name, 'role': role};
        _editingIndex = null;
      });
    }

    nameController.clear();
    roleController.clear();
  }

  void _editUser(int index) {
    setState(() {
      _editingIndex = index;
      nameController.text = users[index]['name']!;
      roleController.text = users[index]['role']!;
    });
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 49, 49, 49),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'USER MANAGEMENT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),

          // User Input Fields
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: roleController,
            decoration: InputDecoration(
              labelText: 'Role',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10.0),

          // Create/Update User Button
          ElevatedButton(
            onPressed: _createOrUpdateUser,
            child: Text(_editingIndex == null ? 'Create User' : 'Update User'),
            style: ElevatedButton.styleFrom(
              backgroundColor:  Color.fromARGB(255, 255, 170, 1),
            ),
          ),
          SizedBox(height: 20.0),

          // User List
          if (users.isNotEmpty)
            ...users.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> user = entry.value;
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
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user['name']!,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            user['role']!,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue[900]),
                            onPressed: () => _editUser(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red[900]),
                            onPressed: () => _deleteUser(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

          if (users.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No users available.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
