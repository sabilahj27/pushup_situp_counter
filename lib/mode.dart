import 'package:flutter/material.dart';

class ModePage extends StatefulWidget {
  @override
  _ModePageState createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  bool _isModalOpen = false;

  void _openModal() {
    setState(() {
      _isModalOpen = true;
    });
  }

  void _closeModal() {
    setState(() {
      _isModalOpen = false;
    });
  }

  void _goToCounter(String mode) {
    // Implement navigation to counter page here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Push-Up dan Sit-Up berbasis Sensor'),
        backgroundColor: Color(0xFF3C4E82),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // Implement navigation to history page here
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFBDCCEE0),
              Color(0xFFF0F7FE),
            ],
          ),
        ),
        child: Column(
          children: [
            Text(
              'Counter Push-Up dan Sit-Up berbasis Sensor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C4E82),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0CA390),
                foregroundColor: Colors.white,
              ),
              child: Text('Push-Up'),
              onPressed: () {
                _goToCounter('Push-Up');
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2C8BBF),
                foregroundColor: Colors.white,
              ),
              child: Text('Sit-Up'),
              onPressed: () {
                _goToCounter('Sit-Up');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C4E82),
                foregroundColor: Colors.white,
              ),
              child: Text('Instruksi Penggunaan'),
              onPressed: _openModal,
            ),
          ],
        ),
      ),
      // Add the modal widget here
    );
  }
}