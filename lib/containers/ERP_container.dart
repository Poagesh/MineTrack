import 'package:flutter/material.dart';

class ERPContainer extends StatefulWidget {
  @override
  _ERPContainerState createState() => _ERPContainerState();
}

class _ERPContainerState extends State<ERPContainer> {
  List<Map<String, String>> erpModules = [
    {'name': 'Inventory Management', 'description': 'Manage stock levels and orders'},
    {'name': 'Supply Chain Monitoring', 'description': 'Monitor and optimize supply chain activities'},
    {'name': 'Financial Reporting', 'description': 'Generate and analyze financial reports'},
    {'name': 'Human Resources Management', 'description': 'Handle employee records and payroll'},
  ];

  void _addERPModule() {
    String moduleName = '';
    String moduleDescription = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add ERP Module'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Module Name'),
                onChanged: (value) {
                  moduleName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  moduleDescription = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                if (moduleName.isNotEmpty && moduleDescription.isNotEmpty) {
                  setState(() {
                    erpModules.add({
                      'name': moduleName,
                      'description': moduleDescription,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _editERPModule(int index) {
    TextEditingController nameController = TextEditingController(text: erpModules[index]['name']);
    TextEditingController descriptionController = TextEditingController(text: erpModules[index]['description']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit ERP Module'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Module Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  erpModules[index] = {
                    'name': nameController.text,
                    'description': descriptionController.text,
                  };
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _removeERPModule(int index) {
    setState(() {
      erpModules.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 224, 224),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 65, 65, 65),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'ENTERPRISE RESOURCE PLANNING (ERP)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          // Dynamically render each ERP module
          if (erpModules.isNotEmpty)
            ...erpModules.asMap().entries.map((entry) {
              int index = entry.key;
              String moduleName = entry.value['name']!;
              String moduleDescription = entry.value['description']!;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ExpansionTile(
                    title: Text(
                      moduleName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          moduleDescription,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text('Edit'),
                            onPressed: () => _editERPModule(index),
                          ),
                          TextButton(
                            child: Text('Delete'),
                            onPressed: () => _removeERPModule(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

          if (erpModules.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No ERP modules available.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),

          // Button to add a new ERP module
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 162, 0),
            ),
            onPressed: _addERPModule,
            child: Text('Add ERP Module'),
          ),
        ],
      ),
    );
  }
}
