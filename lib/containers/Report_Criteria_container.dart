import 'package:flutter/material.dart';

class ReportGenerationCriteria extends StatefulWidget {
  @override
  _ReportGenerationCriteriaState createState() => _ReportGenerationCriteriaState();
}

class _ReportGenerationCriteriaState extends State<ReportGenerationCriteria> {
  String? _selectedReportType;
  DateTimeRange? _selectedDateRange;

  final List<String> _reportTypes = ['Daily Report', 'Weekly Report', 'Monthly Report'];

  void _selectDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
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
              color: const Color.fromARGB(255, 52, 52, 52),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'REPORT GENERATION CRITERIA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),

          // Select Report Type
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SELECT REPORT TYPE',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  value: _selectedReportType,
                  items: _reportTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedReportType = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  hint: Text('Select Report Type'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),

          // Select Date Range
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SELECT DATE RANGE',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: _selectDateRange,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(color: Colors.grey[400]!),
                    ),
                    child: Text(
                      _selectedDateRange == null
                          ? 'Select Date Range'
                          : '${_selectedDateRange!.start.toLocal()} - ${_selectedDateRange!.end.toLocal()}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
