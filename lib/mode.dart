import 'package:flutter/material.dart';
import 'package:pushup_and_situp_countere/counter.dart';

class ModePage extends StatefulWidget {
  @override
  _ModePageState createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  bool _isModalOpen = false;

  void _openModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 500, // adjust the height to fit your content
        child: Column(
          children: [
            // Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            // Header
            Text(
              'Instruksi Penggunaan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Horizontal rule
            Divider(),
            // Swiper container
            Expanded(
              child: ListView(
                children: [
                  // Swiper slide 1
                  Card(
                    child: Column(
                      children: [
                        Text(
                            'Pilih mode push-up atau sit-up dengan menekan tombol yang sesuai.'),
                        Image.asset(
                          'assets/img/mode.png',
                          fit: BoxFit.scaleDown,
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                  // Swiper slide 2
                  Card(
                    child: Column(
                      children: [
                        Text(
                            'Jika memilih mode push-up, pasang masing-masing alat seperti pada gambar dibawah ini.'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/arm.png',
                              fit: BoxFit.scaleDown,
                              width: 150,
                              height: 150,
                            ),
                            Image.asset(
                              'assets/img/leg.png',
                              fit: BoxFit.scaleDown,
                              width: 150,
                              height: 150,
                            ),
                          ],
                        ),
                        Text(
                            'Sebelum memulai, lakukanlah gerakan mode yang sudah terpilih untuk kalibrasi. Lalu tekanlah tombol "Mulai" dan lakukan gerakan hingga waktu hitung mundur selesai.'),
                      ],
                    ),
                  ),
                  // Swiper slide 3
                  Card(
                    child: Column(
                      children: [
                        Text(
                            'Jika memilih mode sit-up, pasang masing-masing alat seperti pada gambar dibawah ini.'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/arm.png',
                              fit: BoxFit.scaleDown,
                              width: 150,
                              height: 150,
                            ), // replace with your image asset
                            Image.asset(
                              'assets/img/chest.png',
                              fit: BoxFit.scaleDown,
                              width: 150,
                              height: 150,
                            ), // replace with your image asset
                          ],
                        ),
                        Text(
                            'Sebelum memulai, lakukanlah gerakan mode yang sudah terpilih untuk kalibrasi. Lalu tekanlah tombol "Mulai" dan lakukan gerakan hingga waktu hitung mundur selesai.'),
                      ],
                    ),
                  ),
                  // Swiper slide 4
                  Card(
                    child: Column(
                      children: [
                        Text(
                            'Anda bisa memilih tombol lainnya pada halaman counter.'),
                        Image.asset('assets/img/counter.png'),
                        Text('Mulai: Mulai menghitung gerakan.'),
                        Text('Ulang: Mengatur ulang penghitung ke nol.'),
                        Text('Berhenti: Menghentikan penghitungan sementara.'),
                        Text('Simpan Data: Menyimpan data hasil perhitungan.'),
                        Text(
                            'Jika Anda selesai, tekan ikon "Kembali" untuk kembali ke halaman utama.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _closeModal() {
    setState(() {
      _isModalOpen = false;
    });
  }

  void _goToCounter(String mode) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CounterPage(mode: mode)),
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
            icon: Icon(Icons.info_outline),
            onPressed: _openModal,
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
        child: Center(
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pilih Mode',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C4E82),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2C8BBF),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Push-Up'),
                      onPressed: () {
                        _goToCounter('Push-Up');
                      },
                    ),
                    SizedBox(width: 10),
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
                  ],
                ),
                SizedBox(height: 20),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Color(0xFF3C4E82),
                //     foregroundColor: Colors.white,
                //   ),
                //   child: Text('Instruksi Penggunaan'),
                //   onPressed: _openModal,
                // ),
              ],
            ),
          ),
        ),
      ),
      // Add the modal widget here
    );
  }
}
