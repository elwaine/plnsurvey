import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_bar_chart.dart';
import 'package:plnsurvey/ui/widgets/custom_bar_chart_cardz.dart';
import 'package:plnsurvey/ui/widgets/custom_location_card.dart';
import 'package:plnsurvey/ui/widgets/custom_pie_cardnotrbanyak.dart';
import 'package:plnsurvey/ui/widgets/custom_pie_chart.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ReportSurveyPage(),
  ));
}

class ReportSurveyPage extends StatefulWidget {
  @override
  _ReportSurveyPageState createState() => _ReportSurveyPageState();
}

class _ReportSurveyPageState extends State<ReportSurveyPage> {
  double containerTopSpacing = 50;
  TextEditingController searchController = TextEditingController();

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
          // SearchBar(searchController: searchController),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: RefreshIndicator(
                onRefresh: _refresh,
                displacement: 80,
                color: kPrimaryColor,
                backgroundColor: Colors.white,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                  physics: BouncingScrollPhysics(),
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Color(0xff1BA0B6), Color(0xff1FD696)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          "Rekapitulasi Program TJSL",
                          style: darkblueTextStyle.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFF1FA8B3),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            '2024',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomBarChartCardz(
                      title: "Program TJSL Tahun 2024",
                      data: {
                        "Sulawesi Barat": 5,
                        "Sulawesi Selatan": 3,
                        "Sulawesi Tengah": 4,
                      },
                      colors: {
                        "Sulawesi Barat": Colors.cyan,
                        "Sulawesi Selatan": Colors.pink,
                        "Sulawesi Tengah": Colors.blue,
                      },
                    ),
                    SizedBox(height: 16),
                    CustomPieChartCardsz(
                      title: "Realisasi Program TJSL Tahun 2024",
                      data: {
                        "Sulawesi Barat": 20,
                        "Sulawesi Tengah": 70,
                        "Sulawesi Selatan": 10,
                      },
                      colors: {
                        "Sulawesi Tengah": Colors.lime,
                        "Sulawesi Selatan": Colors.pinkAccent,
                        "Sulawesi Barat": Colors.amberAccent,
                      },
                    ),
                    SizedBox(height: 16),
                    LocationCard(
                      location: '7605, KAB. MAJENE, SULAWESI BARAT',
                      onPressed: () {
                        print('Lihat Data clicked!');
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
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
        top: MediaQuery.of(context).padding.top + 40,
        bottom: 40,
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
          Expanded(
            child: Text(
              "Report Survey",
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

// class SearchBar extends StatelessWidget {
//   final TextEditingController searchController;

//   const SearchBar({required this.searchController});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 4,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: TextField(
//           controller: searchController,
//           decoration: InputDecoration(
//             hintText: "Search",
//             prefixIcon: Padding(
//               padding: EdgeInsets.only(left: 16, right: 8),
//               child: Icon(Icons.search, color: Colors.grey),
//             ),
//             suffixIcon: Padding(
//               padding: EdgeInsets.only(left: 8, right: 16),
//               child: Icon(Icons.tune, color: Colors.grey),
//             ),
//             border: InputBorder.none,
//             contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
//           ),
//         ),
//       ),
//     );
//   }
// }

class ReportItem extends StatelessWidget {
  final String title;
  final String date;

  const ReportItem({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.insert_drive_file_outlined, color: kPrimaryColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: darkblueTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  date,
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

class ReportSection extends StatelessWidget {
  final String date;
  final List<Widget> notifications;

  const ReportSection({required this.date, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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
