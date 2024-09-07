import 'package:flutter/material.dart';

class OutgoingShiftSummary extends StatefulWidget {
  @override
  _OutgoingShiftSummaryState createState() => _OutgoingShiftSummaryState();
}

class _OutgoingShiftSummaryState extends State<OutgoingShiftSummary> {
  final TextEditingController _summaryController = TextEditingController();
  List<String> _previousSummaries = [];

  void _saveSummary() {
    if (_summaryController.text.isNotEmpty) {
      setState(() {
        _previousSummaries.add(_summaryController.text);
        _summaryController.clear();
      });
    }
  }

  void _clearSummary() {
    _summaryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 230, 230),
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
              borderRadius: BorderRadius.circular(24.0),),
            child: Text(
              'OUTGOING SHIFT - SUMMARY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),

          // Text Input Box
          TextField(
            controller: _summaryController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              labelText: 'Enter shift summary',
              hintText: 'Summary of the outgoing shift...',
            ),
          ),
          SizedBox(height: 10.0),

          // Save and Clear Buttons
          Row(
            children: [
              ElevatedButton(
                onPressed: _saveSummary,
                child: Text('Save Summary'),
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: _clearSummary,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 145, 0),
                ),
                child: Text('Clear'),
              ),
            ],
          ),
          SizedBox(height: 20.0),

          // Display Previous Summaries
          if (_previousSummaries.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Previous Summaries:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                ..._previousSummaries.map((summary) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
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
                    child: Text(summary),
                  ),
                )).toList(),
              ],
            ),
        ],
      ),
    );
  }
}
