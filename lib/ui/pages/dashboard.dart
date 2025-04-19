import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/pages/menyetujuia2.dart';
import 'package:plnsurvey/ui/widgets/custom_button.dart';
import 'package:plnsurvey/ui/widgets/surveycard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: SurveyDashboard(),
    );
  }
}

class SurveyDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF14A2BA),
      drawer: Sidebar(),
      body: Column(
        children: [
          CustomHeader(title: ""),
          SizedBox(height: 80),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              decoration: BoxDecoration(
                color: Color(0xffF0FCFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SearchBar(),
                  SizedBox(height: 16),
                  RecentlyViewedCard(),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Daftar Form Yang Belum Diisi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.76,
                      padding: EdgeInsets.only(
                          top: 2, bottom: 10, right: 7, left: 7),
                      children: [
                        SurveyCard(
                          title: "Survey Form komunitas n stuff",
                          date: "26 Nov 2024",
                          imageUrl: null,
                          routeName: '/surveya',
                          cardHeight: 218,
                          cardWidth: 180,
                        ),
                        SurveyCard(
                          title: "Survey Form",
                          date: "30 Nov 2024",
                          imageUrl: null,
                          routeName: '/surveya',
                          cardHeight: 218,
                          cardWidth: 180,
                        ),
                        SurveyCard(
                          title: "Survey Form komunitas n stuff",
                          date: "26 Nov 2024",
                          imageUrl: null,
                          routeName: '/surveya',
                          cardHeight: 218,
                          cardWidth: 180,
                        ),
                        SurveyCard(
                          title: "Survey Form",
                          date: "30 Nov 2024",
                          imageUrl: null,
                          routeName: '/surveya',
                          cardHeight: 218,
                          cardWidth: 180,
                        ),
                        SurveyCard(
                          title: "Survey Form komunitas n stuff",
                          date: "26 Nov 2024",
                          imageUrl: null,
                          routeName: '/surveya',
                          cardHeight: 218,
                          cardWidth: 180,
                        ),
                        SurveyCard(
                          title: "Survey Form",
                          date: "30 Nov 2024",
                          imageUrl: null,
                          routeName: '/surveya',
                          cardHeight: 218,
                          cardWidth: 180,
                        ),
                        SurveyCard(
                          title: "Survey Form komunitas n stuff",
                          date: "26 Nov 2024",
                          imageUrl: null,
                          routeName: '/surveya',
                          cardHeight: 218,
                          cardWidth: 180,
                        ),
                        SurveyCard(
                          title: "Survey Form",
                          date: "30 Nov 2024",
                          imageUrl: null,
                          routeName: '/surveya',
                          cardHeight: 218,
                          cardWidth: 180,
                        ),
                      ],
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
          width: screenWidth * 0.22,
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
            onPressed: () {
              Navigator.pushNamed(context, '/dashboardapprover');
            },
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
              Transform.translate(
                offset: const Offset(0, -17),
                child: IconButton(
                  icon: Image.asset(
                    'assets/check-square_dark.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/hasilsurveya');
                  },
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -17),
                child: IconButton(
                  icon: Image.asset(
                    'assets/table_blue.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/surveya');
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

class SurveyCard extends StatefulWidget {
  final String title;
  final String date;
  final String? imageUrl;
  final String routeName;
  final bool isCompleted;
  final double cardHeight;
  final double cardWidth;
  final double innerHeight;
  final double innerWidth;

  const SurveyCard({
    required this.title,
    required this.date,
    this.imageUrl,
    required this.routeName,
    this.isCompleted = false,
    this.cardHeight = 150,
    this.cardWidth = 150,
    this.innerHeight = 150,
    this.innerWidth = 150,
    super.key,
  });

  @override
  _SurveyCardState createState() => _SurveyCardState();
}

class _SurveyCardState extends State<SurveyCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.routeName);
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: isExpanded ? 2 : 10),
          width: widget.cardWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Section (Respects cardHeight)
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Stack(
                  children: [
                    Image(
                      image: widget.imageUrl != null
                          ? AssetImage(widget.imageUrl!)
                          : const AssetImage('assets/placeholder_pic.png')
                              as ImageProvider,
                      height: widget.cardHeight * 0.57,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Date Badge
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: widget.isCompleted
                              ? Colors.redAccent
                              : Colors.grey[700],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          widget.date,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content Section (Expandable Title)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => isExpanded = !isExpanded),
                      child: Column(
                        children: [
                          // Animated Title (Expands on Tap)
                          SizedBox(height: 5),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: Text(
                              widget.title,
                              maxLines: isExpanded ? null : 1,
                              overflow: isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF189AB4),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // "Show More" Button (Appears only for long titles)
                          if (widget.title.length > 30)
                            Text(
                              isExpanded ? "Show Less" : "Show More",
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                    // Static Location (Always Centered)
                    const Text(
                      "Makassar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/tianglistrikBG.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF14A2BA),
                  Color(0xFF31EEDD),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person,
                                  size: 40, color: Color(0xFF14A2BA)),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Naylafilsah Haryadi",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "naylafilsah2008@gmail.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        height: 1.5,
                        width: screenWidth * 0.9,
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.check_box,
                                color: Colors.white, size: 28),
                            title: Text(
                              "Daftar Form",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              Navigator.popAndPushNamed(context, '/dashboard');
                            },
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.table_chart,
                                color: Colors.white, size: 28),
                            title: Text(
                              "Report Survey",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/reportsurvey');
                            },
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.logout,
                                color: Colors.white, size: 28),
                            title: Text(
                              "Keluar Akun",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/login-form');
                            },
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(35, 120),
                      child: Image.asset(
                        'assets/tianglistrikPt2.png',
                        height: 500,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xFF14A2BA),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        bottom: 20,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Builder(
              builder: (context) => Transform.translate(
                offset: Offset(22, 1),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    borderRadius: BorderRadius.circular(50),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Icon(Icons.menu, color: Colors.white, size: 40),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 335,
            top: 15,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/notifpage');
                },
                borderRadius: BorderRadius.circular(50),
                child: Icon(Icons.notifications, color: Colors.white, size: 38),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(95, 71),
              child: Text(
                "Selamat Pagi,",
                style: TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(95, 93),
              child: Text(
                "Naylafilsah",
                style: TextStyle(
                  fontSize: 25.3,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Transform.translate(
              offset: Offset(screenWidth * -0.8, screenHeight * 0.087),
              child: SizedBox(
                width: screenWidth * 0.14,
                height: screenHeight * 0.06,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Image.asset(
                    'assets/Customer.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            hintText: "Search",
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class RecentlyViewedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 12, top: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 0.8,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 9.0),
              child: Text(
                "Mendekati tenggat waktu",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.popAndPushNamed(context, '/surveya');
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 0.8,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.12,
                      height: screenHeight * 0.055,
                      child: Image.asset(
                        'assets/bluefile_icon.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Form",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 17.9,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          "20 Des 2024",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
