import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_bar_chart.dart';
import 'package:plnsurvey/ui/widgets/custom_button_download.dart';
import 'package:plnsurvey/ui/widgets/custom_button_table.dart';
import 'package:plnsurvey/ui/widgets/custom_pie_chart.dart';
import 'package:plnsurvey/ui/widgets/custom_pienocard.dart';
import 'package:plnsurvey/ui/widgets/custom_table.dart';
import 'package:plnsurvey/ui/widgets/hasiltable.dart';
import 'package:plnsurvey/ui/widgets/hasiltextfield.dart';
import 'package:plnsurvey/ui/widgets/hasiltextfield_nocard.dart';
import 'package:plnsurvey/ui/widgets/radiolainny.dart';
import 'package:plnsurvey/ui/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plnsurvey/ui/widgets/radiobuttonlist.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 125,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Rectangle part of the header
          Container(
            width: screenWidth,
            height: 60,
            color: kPrimaryColor,
          ),
          // Circle part of the header
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: screenWidth * 0.74,
              height: 130,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenWidth * 0.7),
                  bottomRight: Radius.circular(screenWidth * 0.7),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: screenWidth * 0.07,
                    top: 45,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context, '/dashboard'),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Nama Survey",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HasilSurveyE extends StatefulWidget {
  @override
  _HasilSurveyEState createState() => _HasilSurveyEState();
}

class _HasilSurveyEState extends State<HasilSurveyE> {
  String jenisBantuan = "";

  String koordinat = "";
  String day = '';
  String month = '';
  String year = '';

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Here you can handle the picked image, e.g., display it or pass it to the backend
      print("Picked Image Path: ${image.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kSurveyBgColor,
      body: Column(
        children: [
          CustomHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(children: [
                        CustomPieChart(
                          title: "Kepemilikan aset bantuan (bantuan fisik)",
                          data: {
                            "Layak": 70,
                            "Tidak layak": 30,
                          },
                          colors: {
                            "Layak": Colors.lightGreen,
                            "Tidak layak": Colors.lightBlueAccent,
                          },
                        ),
                        SizedBox(height: 20),
                        HasilTextField(
                            title: "Rekomendasi Besaran Bantuan(jika layak):",
                            texts: [
                              'Rp.500.000',
                              'Rp.500.000',
                              'Rp.500.000',
                            ]),
                        SizedBox(height: 20),
                        HasilTextField(title: "Alasan tidak layak:", texts: [
                          '-',
                        ])
                      ]),
                    ),
                    SizedBox(height: 18),
                    AddressFileWidget(
                      title: 'Tim Survey',
                      files: ["TTD.JPG", "TTD.JPG"],
                      addresses: ['Naylafilsah', 'Aurelia'],
                    ),
                    SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      // hasil2
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Catatan Survey",
                            style: darkblueTextStyle.copyWith(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: black,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Text.rich(
                              TextSpan(
                                style: darkblueTextStyle.copyWith(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: black,
                                  height: 2,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          'diperlukan jika program layak dibantu namun dengan catatan dan menjawab atau memastikan catatan di form evaluasi awal di lapangan'),
                                ],
                              ),
                            ),
                          ),
                          HasilTextField(title: "", texts: [
                            "Program layak untuk dibantu dalam kegiatan persediaan sampah",
                            "Program layak untuk dibantu dalam kegiatan persediaan sampah",
                          ])
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    CustomBarChartCard(
                      title: "Kepemilikan aset bantuan (bantuan fisik)",
                      data: {
                        "Di Tanah Pribadi": 5,
                        "Lahan Pribadi": 3,
                        "Kepemilikan Masyarakat/komunitas": 4,
                        "Lainnya: Milik keluarga": 2,
                      },
                      colors: {
                        "Di Tanah Pribadi": Colors.cyan,
                        "Lahan Pribadi": Colors.pink,
                        "Kepemilikan Masyarakat/komunitas": Colors.blue,
                        "Lainnya: Milik keluarga": Colors.red,
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        // Back Button (Left Side)
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff24D7FF),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 0.5,
                                  spreadRadius: 0.5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: CustomPaint(
                              painter: BackArrowPainter(),
                            ),
                          ),
                        ),
                        // Approve Button (Right Side)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: DownloadButton(
                              title: 'Download Survey',
                              onPressed: () {
                                Navigator.pushNamed(context, '/surveya');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
            backgroundColor: Colors.white,
            onPressed: () {},
            elevation: 0,
            child: Image.asset(
              'assets/home-orl.png',
              width: 28,
              height: 28,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 2,
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: IconButton(
                  icon: Image.asset(
                    'assets/check-square-orl.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    // Add logic here
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: IconButton(
                  icon: Image.asset(
                    'assets/table-orl.png',
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

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    path.moveTo(size.width * 0.4, size.height * 0.3);
    path.lineTo(size.width * 0.6, size.height * 0.5);
    path.lineTo(size.width * 0.4, size.height * 0.7);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HasilSurveyE(),
  ));
}
