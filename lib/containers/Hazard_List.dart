import 'package:flutter/material.dart';

class ListOfHazardsContainer extends StatefulWidget {
  @override
  _ListOfHazardsContainerState createState() => _ListOfHazardsContainerState();
}

class _ListOfHazardsContainerState extends State<ListOfHazardsContainer> {
  List<String> hazards = [
    'Slippery floors in the northern passage.',
    'Exposed electrical wiring near the main entrance.',
    'Unstable rock formations in the western tunnel.',
  ];

  TextEditingController _hazardController = TextEditingController();

  void _addHazard() {
    if (_hazardController.text.isNotEmpty) {
      setState(() {
        hazards.add(_hazardController.text);
        _hazardController.clear();
      });
    }
  }

  void _updateHazard(int index, String updatedHazard) {
    setState(() {
      hazards[index] = updatedHazard;
    });
  }

  void _removeHazard(int index) {
    setState(() {
      hazards.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.orange[800],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'LIST OF HAZARDS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),

          // Displaying Hazards
          if (hazards.isNotEmpty)
            ...hazards.asMap().entries.map((entry) {
              int index = entry.key;
              String hazard = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          hazard,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.orange[800]),
                        onPressed: () {
                          _hazardController.text = hazard;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Update Hazard'),
                                content: TextField(
                                  controller: _hazardController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter updated hazard',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      _updateHazard(index, _hazardController.text);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Update'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeHazard(index),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

          if (hazards.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No hazards reported.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                ),
              ),
            ),

          SizedBox(height: 20.0),

          // Add Hazard Input and Button
          TextField(
            controller: _hazardController,
            decoration: InputDecoration(
              hintText: 'Enter new hazard',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[800],
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            ),
            onPressed: _addHazard,
            child: Text(
              'Add Hazard',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
