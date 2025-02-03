import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_bar_chart.dart';
import 'package:plnsurvey/ui/widgets/custom_pie_chart.dart';
import 'package:plnsurvey/ui/widgets/hasiltable.dart';
import 'package:plnsurvey/ui/widgets/hasiltextfield.dart';
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

class HasilSurveyA extends StatefulWidget {
  @override
  _HasilSurveyAState createState() => _HasilSurveyAState();
}

class _HasilSurveyAState extends State<HasilSurveyA> {
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
                    HasilTextContainer(title: 'Nama Program', texts: [
                      "Bantuan Kendaraan Pengangkutan Sampah, Yayasan Mitra Husada"
                    ]),
                    SizedBox(height: 16),
                    CustomPieChartCard(
                      title: "Kepemilikan aset bantuan (bantuan fisik)",
                      data: {
                        "Bantuan Fisik": 70,
                        "Bantuan Non Fisik": 30,
                      },
                      colors: {
                        "Bantuan Fisik": Colors.blue,
                        "Bantuan Non Fisik": Colors.pink,
                      },
                    ),
                    SizedBox(height: 18),
                    HasilTextContainer(title: 'Alamat Denah', texts: [
                      "Bonto Marannu, Moncong Loe, Maros Kabupaten, Selatan Sulawesi",
                      "Bonto Marannu, Moncong Loe, Maros Kabupaten, Selatan Sulawesi",
                      "Bonto Marannu, Moncong Loe, Maros Kabupaten, Selatan Sulawesi",
                      "Bonto Marannu, Moncong Loe, Maros Kabupaten, Selatan Sulawesi",
                      "Bonto Marannu, Moncong Loe, Maros Kabupaten, Selatan Sulawesi",
                    ]),
                    SizedBox(height: 18),
                    SizedBox(height: 18),
                    HasilTextContainer(title: 'Tanggal Survey', texts: [
                      "22 Desember 2024",
                      "22 Desember 2024",
                      "22 Desember 2024",
                    ]),
                    SizedBox(height: 16),
                    HasilTextContainer(
                        title: 'Jarak dari PLN terdekat',
                        texts: [
                          "-",
                        ]),
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),
                    CustomPieChartCard(
                      title: "Keberlanjutan Bantuan",
                      data: {
                        "Dikelola pribadi": 20,
                        "Dikelola masyarakat atau komunitas": 70,
                        "Lainnya": 10,
                      },
                      colors: {
                        "Dikelola pribadi": Colors.green,
                        "Dikelola masyarakat atau komunitas": Colors.pinkAccent,
                        "Lainnya": Colors.amberAccent,
                      },
                    ),
                    SizedBox(height: 16),
                    CustomBarChartCard(
                      title: "Kepemilikan aset bantuan (bantuan fisik)",
                      data: {
                        "Donatur dari beberapa institusi BUMN/pemerintah": 2,
                        "Dari PLN 100%": 3,
                        "Ada konstribusi masyarakat": 4,
                        "Lainnya: Konstribusi keluarga": 1,
                      },
                      colors: {
                        "Donatur dari beberapa institusi BUMN/pemerintah":
                            Colors.purple,
                        "Dari PLN 100%": Colors.blue,
                        "Ada konstribusi masyarakat": Colors.green,
                        "Lainnya: Konstribusi keluarga": Colors.pinkAccent,
                      },
                    ),
                    SizedBox(height: 16),
                    CustomPieChartCard(
                      title: "Potensi pengembangan program untuk Citra PLN",
                      data: {
                        "Kesediaan dibangun papan nama “BANTUAN PLN”": 70,
                        "Kesediaan  memberikan nama program yang memberikan karakter PLN":
                            40,
                        "Lainnya": 10,
                      },
                      colors: {
                        "Kesediaan dibangun papan nama “BANTUAN PLN”":
                            Colors.red,
                        "Kesediaan  memberikan nama program yang memberikan karakter PLN":
                            Colors.orange,
                        "Lainnya": Colors.brown,
                      },
                    ),
                    SizedBox(height: 16),
                    CustomPieChartCard(
                      title: "Manfaat untuk Masyarakat",
                      data: {
                        "Sistem pengelolaan sampah yang baik, sehingga meningkatkan kesehatan masyarakat dan kelestarian lingkungan":
                            70,
                        "Mendukung program kebersihan dan kampanye lingkungan":
                            40,
                      },
                      colors: {
                        "Sistem pengelolaan sampah yang baik, sehingga meningkatkan kesehatan masyarakat dan kelestarian lingkungan":
                            Colors.lightGreen,
                        "Mendukung program kebersihan dan kampanye lingkungan":
                            Colors.amberAccent,
                      },
                    ),
                    SizedBox(height: 18),
                    CustomPieChartCard(
                      title: "Manfaat untuk PLN",
                      data: {
                        "Meningkatkan Citra Perusahaan": 60,
                        "Meningkatkan hubungan baik dengan stakeholder": 30,
                        "Mendapatkan dukungan dan masyarakat luas khususnya yang tersentuh dengan bantuan yang diberikan baik secara langsung maupun tidak langsung":
                            10,
                      },
                      colors: {
                        "Meningkatkan Citra Perusahaan": Colors.cyan,
                        "Meningkatkan hubungan baik dengan stakeholder":
                            Colors.lightGreen,
                        "Mendapatkan dukungan dan masyarakat luas khususnya yang tersentuh dengan bantuan yang diberikan baik secara langsung maupun tidak langsung":
                            Colors.yellow,
                      },
                    ),
                    SizedBox(height: 18),
                    HasilTextContainer(title: 'Titik koordinat', texts: [
                      "-12833487380297502",
                      "-12833487380297502",
                      "-12833487380297502",
                    ]),
                    SizedBox(height: 16),
                    AddressFileWidget(
                      title: "Alamat Denah",
                      files: ["Gambar.JPG", "Gambar.JPG"],
                      addresses: [
                        "Bonto Marannu, Moncong Loe, Maros Kabupaten, Selatan Sulawesi",
                        "Bonto Marannu, Moncong Loe, Maros Kabupaten, Selatan Sulawesi",
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
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
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hal lain yang ingin disampaikan",
                              style: darkblueTextStyle.copyWith(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            HasilTextContainer(
                                title: "Perkiraan jumlah penerima manfaat",
                                texts: [
                                  '500 kepala keluarga',
                                  '500 kepala keluarga',
                                  '500 kepala keluarga',
                                ]),
                            SizedBox(height: 16),
                            HasilTextContainer(
                                title: "Potensi Keberlanjutan",
                                texts: [
                                  '-',
                                ])
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/hasilsurveyb');
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
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
                              painter: ArrowPainter(),
                            ),
                          ),
                        ),
                      ),
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HasilSurveyA(),
  ));
}
