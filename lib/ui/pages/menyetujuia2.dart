import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/Nama Survey.png', // Gambar logo dari assets
          height: 40,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/Back.png'), // Gambar dari assets
          onPressed: () {
            // Tambahkan fungsi navigasi ke halaman sebelumnya
          },
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Jika bantuan mobil/motor atas nama siapa?',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '(tidak bisa kepemilikan perorangan) Yayasan/organisasi',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '', // HintText dikosongkan
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
           _buildSection(
  title: 'Syarat jika bantuan mobil/motor:',
  content: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('1. Surat keterangan domisili',style: TextStyle(color: Colors.blue)),
      SizedBox(height: 8),
      Text('2. Surat Kuasa Asli',style: TextStyle(color: Colors.blue)),
      SizedBox(height: 8),
      Text('3. NPWP Asli',style: TextStyle(color: Colors.blue)),
      SizedBox(height: 8),
      Text('4. Akta pendirian copy 2 legalisir',style: TextStyle(color: Colors.blue)),
      SizedBox(height: 8),
      Text('5. Tanda daftar yayasan',style: TextStyle(color: Colors.blue)),
      SizedBox(height: 8),
      Text(
        '6. Bukti pendirian yayasan/akta Yayasan bidang Kesehatan untuk permintaan bantuan mobil ambulance',style: TextStyle(color: Colors.blue)
      ),
      SizedBox(height: 8),
      TextField(
        decoration: InputDecoration(
          hintText: '', // HintText dikosongkan
          border: OutlineInputBorder(),
        ),
      ),
    ],
  ),
),

            SizedBox(height: 16),
            _buildSection(
              title: 'Informasi Lainnya',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Surveyor menanyakan beberapa pertanyaan diatas',style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 8),
                  Text('2. Melampirkan dokumen tersebut diatas',style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 8),
                  Text('3. Foto situasi kondisi lapangan',style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 8),
                  Text('4. Mencatat NO HP PIC (yang diisikan di lembar form survey)',style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 8),
                  Text('5. Mencatat Alamat/tagging lokasi (yang diisikan di lembar form survey)',style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 8),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.cyan,
                    child: InkWell(
                      onTap: () {
                        // Fungsi untuk tombol "arrow kiri"
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Image.asset(
                          'assets/chevron-right.png', // Gambar untuk tombol kiri
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Colors.cyan,
                    child: InkWell(
                      onTap: () {
                        // Fungsi untuk tombol "arrow kanan"
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Image.asset(
                          'assets/chevron-left.png', // Gambar untuk tombol kanan
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            backgroundColor: Colors.cyan,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/checkw-square.png', // Gambar untuk ikon navbar
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/tablew.png', // Gambar untuk ikon navbar
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                label: '',
              ),
            ],
          ),
          Positioned(
            top: -30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.cyan,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      // Fungsi untuk tombol tengah
                    },
                    child: Center(
                      child: Image.asset(
                        'assets/homeb.png', // Gambar untuk tombol tengah
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content}) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          content,
        ],
      ),
    );
  }
}
