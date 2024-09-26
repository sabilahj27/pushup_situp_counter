import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pushup_and_situp_countere/main.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<List<dynamic>> _csvData = [];

  @override
  void initState() {
    super.initState();
    _loadCsvData();
  }

  Future<void> _loadCsvData() async {
    final csvData = await rootBundle.loadString('assets/csv/history.csv');
    List<String> csvRows = csvData.split('\n');
    csvRows.removeAt(0); // Remove the first row (header)
    List<List<dynamic>> csvTable =
        CsvToListConverter().convert(csvRows.join('\n'));
    setState(() {
      _csvData = csvTable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBDCCEE0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyApp()),
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
              'Riwayat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3C4E82),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            'Nama',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            'Mode',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            'Benar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            'Salah',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text(
                            'Waktu',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          numeric: false,
                        ),
                      ],
                      rows: _csvData.map((csvRow) {
                        return DataRow(
                          cells: csvRow.map((cell) {
                            return DataCell(Text(cell.toString()));
                          }).toList(),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0CA390),
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Unduh'),
                        onPressed: () {
                          // Handle download button press
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6666),
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Hapus Riwayat'),
                        onPressed: () {
                          // Handle clear history button press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
