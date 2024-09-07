import 'package:flutter/material.dart';

class DataSecurityContainer extends StatefulWidget {
  @override
  _DataSecurityContainerState createState() => _DataSecurityContainerState();
}

class _DataSecurityContainerState extends State<DataSecurityContainer> {
  List<String> encryptionMethods = [];
  List<String> accessControls = [];

  final TextEditingController _encryptionController = TextEditingController();
  final TextEditingController _accessControlController = TextEditingController();

  void _addEncryptionMethod(String method) {
    setState(() {
      encryptionMethods.add(method);
    });
  }

  void _addAccessControl(String control) {
    setState(() {
      accessControls.add(control);
    });
  }

  void _saveEncryptionMethod(int index, String updatedMethod) {
    setState(() {
      encryptionMethods[index] = updatedMethod;
    });
  }

  void _saveAccessControl(int index, String updatedControl) {
    setState(() {
      accessControls[index] = updatedControl;
    });
  }

  void _removeEncryptionMethod(int index) {
    setState(() {
      encryptionMethods.removeAt(index);
    });
  }

  void _removeAccessControl(int index) {
    setState(() {
      accessControls.removeAt(index);
    });
  }

  void _modifyEncryptionMethod(int index) {
    _encryptionController.text = encryptionMethods[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Modify Encryption Method'),
          content: TextField(
            controller: _encryptionController,
            decoration: InputDecoration(labelText: 'Encryption Method'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _saveEncryptionMethod(index, _encryptionController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _modifyAccessControl(int index) {
    _accessControlController.text = accessControls[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Modify Access Control'),
          content: TextField(
            controller: _accessControlController,
            decoration: InputDecoration(labelText: 'Access Control'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _saveAccessControl(index, _accessControlController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 179, 179, 179),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('ENCRYPTION', Color.fromARGB(255, 61, 61, 61)),
          ...encryptionMethods.asMap().entries.map((entry) {
            int index = entry.key;
            String method = entry.value;
            return _buildMethodItem(
              method,
              index,
              () => _modifyEncryptionMethod(index),
              () => _removeEncryptionMethod(index),
            );
          }).toList(),
          _buildAddButton('Add Encryption Method', _encryptionController, _addEncryptionMethod),
          SizedBox(height: 20),
          _buildSectionHeader('ACCESS CONTROL', Color.fromARGB(255, 58, 58, 58)),
          ...accessControls.asMap().entries.map((entry) {
            int index = entry.key;
            String control = entry.value;
            return _buildMethodItem(
              control,
              index,
              () => _modifyAccessControl(index),
              () => _removeAccessControl(index),
            );
          }).toList(),
          _buildAddButton('Add Access Control', _accessControlController, _addAccessControl),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color? color) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMethodItem(String method, int index, VoidCallback onModify, VoidCallback onDelete) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
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
            Expanded(
              child: Text(
                method,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Color.fromARGB(255, 255, 170, 0)),
                  onPressed: onModify,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Color.fromARGB(255, 255, 170, 0)),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(String label, TextEditingController controller, Function(String) onAdd) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 170, 0),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add New $label'),
                content: TextField(
                  controller: controller,
                  decoration: InputDecoration(labelText: label),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      onAdd(controller.text);
                      Navigator.of(context).pop();
                      controller.clear();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Text(label),
      ),
    );
  }
}
