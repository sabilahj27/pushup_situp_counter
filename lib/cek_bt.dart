import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BluetoothConnector {
  FlutterReactiveBle _ble = FlutterReactiveBle();
  String? _deviceId;
  bool _connected = false;

  Future<void> connectToDevice(String deviceId) async {
    _deviceId = deviceId;
    _ble.connectToDevice(
      id: deviceId,
      servicesWithCharacteristicsToDiscover: {}, // adjust this to your needs
      connectionTimeout: const Duration(seconds: 2),
    ).listen((connectionState) {
      if (connectionState == DeviceConnectionState.connected) {
        _connected = true;
      } else {
        _connected = false;
      }
    }, onError: (Object error) {
      // Handle a possible error
      print('Error connecting to device: $error');
    });
  }

  bool get isConnected => _connected;
}

class BluetoothPage extends StatelessWidget {
  final BluetoothConnector _connector = BluetoothConnector();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Connector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _connector.connectToDevice("34:B7:DA:F8:88:FA");
              },
              child: Text('Connect to Device'),
            ),
            SizedBox(height: 20),
            Text(
              _connector.isConnected ? 'Connected' : 'Not Connected',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}