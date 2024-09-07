import 'package:flutter/material.dart';

class ControlMeasuresContainer extends StatefulWidget {
  @override
  _ControlMeasuresContainerState createState() =>
      _ControlMeasuresContainerState();
}

class _ControlMeasuresContainerState extends State<ControlMeasuresContainer> {
  List<String> controlMeasures = [];
  final TextEditingController _textController = TextEditingController();

  void _addControlMeasure() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        controlMeasures.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _editControlMeasure(int index) {
    _textController.text = controlMeasures[index];
    _removeControlMeasure(index);
  }

  void _removeControlMeasure(int index) {
    setState(() {
      controlMeasures.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 199, 199, 199),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 61, 61, 61),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'CONTROL MEASURES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),

          // Text input box
          TextField(
            controller: _textController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Enter control measures...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            ),
          ),
          SizedBox(height: 10.0),

          // Add button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 128, 0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            ),
            onPressed: _addControlMeasure,
            child: Text(
              'Add Measure',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          SizedBox(height: 20.0),

          // List of control measures
          if (controlMeasures.isNotEmpty)
            ...controlMeasures.asMap().entries.map((entry) {
              int index = entry.key;
              String measure = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
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
                          measure,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Color.fromARGB(255, 255, 128, 0)),
                            onPressed: () => _editControlMeasure(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Color.fromARGB(255, 255, 128, 0)),
                            onPressed: () => _removeControlMeasure(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          if (controlMeasures.isEmpty)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'No control measures added yet.',
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
