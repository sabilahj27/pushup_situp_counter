import 'package:flutter/material.dart';
import 'package:pushup_and_situp_countere/cek_bt.dart';
import 'package:pushup_and_situp_countere/history.dart';
import 'package:pushup_and_situp_countere/mode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koneksi Bluetooth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isConnected = false;
  String _connectionStatus = 'Disconnected';

  void _connectBLE() async {
    // Implement BLE connection logic here
    setState(() {
      _isConnected = true;
      _connectionStatus = 'Connected';
    });
  }

  void _goToMode() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ModePage()),
    );
  }

  void _goBT() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BluetoothPage()),
    );
  }

  void _showResetModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset ESP32'),
          content: Text('Are you sure you want to reset the ESP32 device?'),
          actions: [
            TextButton(
              child: Text('Yes, Reset'),
              onPressed: () {
                // Implement ESP32 reset logic here
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xFFBDCCEE0),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
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
              child: Text('Hubungkan'),
              // onPressed: _connectBLE,
              onPressed: _goBT,
            ),
            SizedBox(height: 10),
            Text(
              _connectionStatus,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2C8BBF),
                foregroundColor: Colors.white,
              ),
              child: Text('Selanjutnya'),
              onPressed: _goToMode,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3C4E82),
                foregroundColor: Colors.white,
              ),
              child: Text('Reset ESP32'),
              onPressed: _showResetModal,
            ),
          ],
        ),
      ),
    );
  }
}
