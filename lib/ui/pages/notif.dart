import 'package:flutter/material.dart';  

void main() {  
  runApp(MyApp());  
}  

class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      debugShowCheckedModeBanner: false, // Menghilangkan tulisan debug  
      home: NotificationPage(),  
    );  
  }  
}  

class NotificationPage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: Colors.blue[500],  
      appBar: AppBar(  
        backgroundColor: Colors.blue[500],  
        elevation: 0,  
        leading: Image.asset('assets/Back.png', width: 24, height: 24), // Ganti dengan gambar dari assets  
        title: Image.asset('assets/Notifikasi.png', width: 150), // Ganti dengan gambar dari assets  
        centerTitle: true,  
      ),  
      body: Column(  
        children: [  
          Expanded(  
            child: Container(  
              decoration: BoxDecoration(  
                color: Colors.white,  
                borderRadius: BorderRadius.only(  
                  topLeft: Radius.circular(30),  
                  topRight: Radius.circular(30),  
                ),  
              ),  
              child: ListView(  
                padding: EdgeInsets.all(16),  
                children: [  
                  NotificationSection(  
                    date: '27 Desember 2024',  
                    notifications: [  
                      NotificationItem(  
                        title: 'Tenggat Waktu Form',  
                        description: 'Tenggat Form Survey 8 sudah hampir dekat',  
                      ),  
                      NotificationItem(  
                        title: 'Form Persetujuan Baru',  
                        description: 'Form Survey 11 butuh persetujuan',  
                      ),  
                    ],  
                  ),  
                  NotificationSection(  
                    date: '26 Desember 2024',  
                    notifications: [  
                      NotificationItem(  
                        title: 'Tenggat Waktu Form',  
                        description: 'Tenggat Form Survey 1 sudah hampir dekat',  
                      ),  
                    ],  
                  ),  
                  NotificationSection(  
                    date: '22 November 2024',  
                    notifications: [  
                      NotificationItem(  
                        title: 'Form Persetujuan Baru',  
                        description: 'Form Survey 11 butuh persetujuan',  
                      ),  
                      NotificationItem(  
                        title: 'Tenggat Waktu Form',  
                        description: 'Tenggat Form Survey 1 sudah hampir dekat',  
                      ),  
                    ],  
                  ),  
                ],  
              ),  
            ),  
          ),  
        ],  
      ),  

      // Floating action button dengan border radius
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(50), // Menambahkan border radius
        child: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {},  // Fungsi yang dipanggil saat tombol ditekan
          child: Image.asset(
            'assets/home.png', // Ikon floating action button
            width: 28,
            height: 28,
          ),
        ),
      ),
      
      // Penempatan FAB di tengah BottomNavigationBar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/check-square.png', width: 24, height: 24), // Menggunakan ikon dari assets
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/tablehitam.png', width: 24, height: 24), // Menggunakan ikon dari assets
            label: ''
          ),
        ],
        backgroundColor: Colors.blue[100],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );  
  }  
}  

class NotificationSection extends StatelessWidget { 
  final String date; 
  final List<Widget> notifications; 

  NotificationSection({required this.date, required this.notifications}); 

  @override 
  Widget build(BuildContext context) { 
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [ 
        Text( 
          date, 
          style: TextStyle( 
            color: Colors.grey[500], 
            fontWeight: FontWeight.bold, 
          ), 
        ), 
        SizedBox(height: 8), 
        ...notifications, 
        SizedBox(height: 16), 
      ], 
    ); 
  } 
} 

class NotificationItem extends StatelessWidget { 
  final String title; 
  final String description; 

  NotificationItem({required this.title, required this.description}); 

  @override 
  Widget build(BuildContext context) { 
    return Container( 
      margin: EdgeInsets.only(bottom: 8), 
      padding: EdgeInsets.all(16), 
      decoration: BoxDecoration( 
        color: Colors.white, 
        borderRadius: BorderRadius.circular(10), 
        boxShadow: [ 
          BoxShadow( 
            color: Colors.black12, 
            blurRadius: 6, 
            offset: Offset(0, 2), 
          ), 
        ], 
      ), 
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [ 
          Row( 
            children: [ 
              Image.asset('assets/bell.png', width: 30, height: 30), // Menggunakan ikon dari assets 
              SizedBox(width: 16), 
              Column( 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [ 
                  Text( 
                    title, 
                    style: TextStyle( 
                      color: Colors.blue[500], 
                      fontWeight: FontWeight.bold, 
                    ), 
                  ), 
                  Text( 
                    description, 
                    style: TextStyle(color: Colors.grey[500]), 
                  ), 
                ], 
              ), 
            ], 
          ), 
          Icon(Icons.more_horiz, color: Colors.grey[500]), 
        ], 
      ), 
    ); 
  } 
}
