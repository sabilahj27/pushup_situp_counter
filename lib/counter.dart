import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pushup_and_situp_countere/history.dart';

class CounterPage extends StatefulWidget {
  final String mode;

  CounterPage({required this.mode});
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  int _wrong = 0;
  int _countdownTime = 60;
  late Timer _timer;
  bool _timerRunning = false;
  String _modeTitle = '';

  @override
  void initState() {
    super.initState();
    _modeTitle = widget.mode;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBDCCEE0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _goToMode,
        ),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _modeTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Gerakan Benar',
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            width: 165,
                            height: 165,
                            decoration: BoxDecoration(
                              color: Color(0xFF0B8D7C), // #0b8d7c
                              borderRadius: BorderRadius.circular(90),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                _counter.toString(),
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            'Gerakan Salah',
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            width: 165,
                            height: 165,
                            decoration: BoxDecoration(
                              color: Color(0xFFDC2D59), // #dc2d59
                              borderRadius: BorderRadius.circular(90),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                _wrong.toString(),
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _formatTime(_countdownTime),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _startTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0CA390), // #0ca390
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Mulai'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _restartTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFAAB51), // #faab51
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Ulang'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _stopReceivingData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFD3768), // #fd3768
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Berhenti'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveData,
        backgroundColor: Color(0xFF2C8BBF),
        child: Icon(Icons.save, color: Colors.white,),
      ),
    );
  }

  String _formatTime(int time) {
    int minutes = time ~/ 60;
    int seconds = time % 60;
    return '${minutes < 10 ? '0' : ''}$minutes:${seconds < 10 ? '0' : ''}$seconds';
  }

  void _startTimer() {
    if (!_timerRunning) {
      _timerRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _countdownTime--;
          if (_countdownTime <= 0) {
            _stopReceivingData();
          }
        });
      });
    }
  }

  void _restartTimer() {
    _stopReceivingData();
    _counter = 0;
    _wrong = 0;
    _countdownTime = 60;
    setState(() {});
  }

  void _stopReceivingData() {
    _timer?.cancel();
    _timerRunning = false;
  }

  void _goToMode() {
    Navigator.pop(context);
  }

  void _saveData() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryPage()),
    );
  }
}
