import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListSurveyPage(),
    );
  }
}

class ListSurveyPage extends StatelessWidget {
  ListSurveyPage({super.key});

  final List<Map<String, dynamic>> surveyList = [
    {'date': '26 Nov 2024', 'title': 'Nama Form', 'image': 'assets/prog.png', 'width': 100.0, 'height': 100.0},
    {'date': '26 Nov 2024', 'title': 'Nama Form', 'image': 'assets/damai.png', 'width': 100.0, 'height': 100.0},
    {'date': '25 Nov 2024', 'title': 'Nama Form', 'image': 'assets/damai.png', 'width': 100.0, 'height': 100.0},
    {'date': '25 Nov 2024', 'title': 'Nama Form', 'image': 'assets/prog.png', 'width': 100.0, 'height': 100.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: Image.asset('assets/back.png', width: 24, height: 24),
          onPressed: () {},
        ),
        title: Image.asset(
          'assets/listsrvy.png',
          height: 70,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.cyan,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/search.png'),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/sorting.png'),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                // Latar belakang cyan
                Container(
                  color: Colors.cyan,
                ),
                // Container utama dengan warna hitam
                Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan[50],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Program yang perlu disetujui',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: surveyList.length,
                            itemBuilder: (context, index) {
                              final item = surveyList[index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SizedBox(
                                  height: 180, // Tinggi card diperbesar
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 150, // Tinggi gambar diperbesar
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(16),
                                              ),
                                              color: Colors.grey[200],
                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.vertical(
                                                top: Radius.circular(16),
                                              ),
                                              child: Image.asset(
                                                item['image'],
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 8,
                                            left: 8,
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                item['date'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item['title'],
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {},
          child: Image.asset(
            'assets/home.png',
            width: 28,
            height: 28,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/checkblue.png', width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/tablehitam.png', width: 24, height: 24),
            label: '',
          ),
        ],
      ),
    );
  }
}
