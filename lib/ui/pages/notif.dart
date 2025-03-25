import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NotificationPage(),
  ));
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  double containerTopSpacing = 50;

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          CustomHeader(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              displacement: 80,
              color: kPrimaryColor,
              backgroundColor: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: containerTopSpacing = 2),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NotificationSection(
                              date: '27 Desember 2024',
                              notifications: [
                                NotificationItem(
                                  title: 'Tenggat Waktu Form',
                                  description:
                                      'Tenggat Form Survey 8 sudah hampir dekat.',
                                ),
                                NotificationItem(
                                  title: 'Form Persetujuan Baru',
                                  description:
                                      'Form Survey 11 butuh persetujuan.',
                                ),
                              ],
                            ),
                            NotificationSection(
                              date: '26 Desember 2024',
                              notifications: [
                                NotificationItem(
                                  title: 'Tenggat Waktu Form',
                                  description:
                                      'Tenggat Form Survey 1 sudah hampir dekat.',
                                ),
                              ],
                            ),
                            NotificationSection(
                              date: '22 November 2024',
                              notifications: [
                                NotificationItem(
                                  title: 'Form Persetujuan Baru',
                                  description:
                                      'Form Survey 11 butuh persetujuan.',
                                ),
                                NotificationItem(
                                  title: 'Tenggat Waktu Form',
                                  description:
                                      'Tenggat Form Survey 1 sudah hampir dekat.',
                                ),
                              ],
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: screenHeight * 0.1,
          width: screenWidth * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: () {},
            elevation: 0,
            child: Image.asset(
              'assets/home.png',
              width: 28,
              height: 28,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xffF2F8F9),
        shape: const CircularNotchedRectangle(),
        notchMargin: -7,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: IconButton(
                  icon: Image.asset(
                    'assets/check-square_dark.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    // Add logic here
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: IconButton(
                  icon: Image.asset(
                    'assets/table_blue.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    // Add logic here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        bottom: 20,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                width: 40,
                height: 40,
                child: CustomPaint(
                  painter: BackArrowPainter(),
                ),
              ),
            ),
          ),
          SizedBox(height: 70),
          Expanded(
            child: Text(
              "Notifikasi",
              textAlign: TextAlign.center,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: black,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 56),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;

  const NotificationItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/bell.png', width: 30, height: 30),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.more_horiz, color: Colors.grey),
        ],
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final String date;
  final List<Widget> notifications;

  const NotificationSection({required this.date, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...notifications,
        ],
      ),
    );
  }
}

class BackArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    path.moveTo(size.width * 0.6, size.height * 0.3);
    path.lineTo(size.width * 0.4, size.height * 0.5);
    path.lineTo(size.width * 0.6, size.height * 0.7);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
