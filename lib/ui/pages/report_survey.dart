import 'package:flutter/material.dart';

void main() {
  runApp(const ReportSurveyApp());
}

class ReportSurveyApp extends StatelessWidget {
  const ReportSurveyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReportSurveyScreen(),
    );
  }
}

class ReportSurveyScreen extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {'month': 'Desember', 'items': ['Nama Program', 'Nama Program', 'Nama Program']},
    {'month': 'November', 'items': ['Nama Program', 'Nama Program']},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/Back.png', color: Colors.white),
          onPressed: () {},
        ),
        title: Center(
          child: Image.asset(
            'assets/Report Survey.png', // Pastikan nama dan path sesuai
            height: 40, // Sesuaikan ukuran gambar
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset('assets/Sorting.png', color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          // ListView
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final monthData = data[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        monthData['month'],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...monthData['items'].map<Widget>((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: Image.asset('assets/file-text.png', color: Colors.blue),
                            title: Text(item),
                            subtitle: const Text('20 Des 2024'),
                            trailing: Image.asset('assets/more-horizontal.png'),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/check-square.png', width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/home.png', width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/table.png', width: 24, height: 24),
            label: '',
          ),
        ],
        currentIndex: 1, // Set active item
        onTap: (index) {
          // Handle navigation
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Image.asset('assets/home.png', color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
