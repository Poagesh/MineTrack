import 'package:flutter/material.dart';

class ForwardReportContainer extends StatefulWidget {
  @override
  _ForwardReportContainerState createState() => _ForwardReportContainerState();
}

class _ForwardReportContainerState extends State<ForwardReportContainer> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _ccController = TextEditingController();

  void _sendReport() {
    final String fromEmail = _fromController.text;
    final String toEmail = _toController.text;
    final String ccEmail = _ccController.text;

    if (fromEmail.isNotEmpty && toEmail.isNotEmpty) {
      // Perform the email sending logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Report sent from $fromEmail to $toEmail with CC to $ccEmail')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid From and To email addresses')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 207, 207, 207),
        borderRadius: BorderRadius.circular(24.0),
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
          // Header
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 53, 53, 53),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Text(
              'FORWARD REPORT VIA EMAIL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.0),

          // From Email input field
          _buildEmailField('From:', _fromController),

          SizedBox(height: 20.0),

          // To Email input field
          _buildEmailField('To:', _toController),

          SizedBox(height: 20.0),

          // CC Email input field
          _buildEmailField('CC:', _ccController),

          SizedBox(height: 20.0),

          // Send Report button
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 153, 0),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              ),
              onPressed: _sendReport,
              child: Text(
                'Send Report',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the email fields
  Widget _buildEmailField(String label, TextEditingController controller) {
    return Container(
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
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 92, 92, 92),
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: '$label Email Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            ),
          ),
        ],
      ),
    );
  }
}
