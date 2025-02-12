import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_bar_chart.dart';
import 'package:plnsurvey/ui/widgets/custom_pie_chart.dart';
import 'package:plnsurvey/ui/widgets/custom_pienocard.dart';
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

class HasilSurveyD extends StatefulWidget {
  @override
  _HasilSurveyDState createState() => _HasilSurveyDState();
}

class _HasilSurveyDState extends State<HasilSurveyD> {
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
                    HasilTextContainer(
                        title:
                            'Siapa pengelola bantuan? Apakah ada struktur organisasi pengelolanya?',
                        texts: [
                          "yayasan mitra Huseda Sulawesi Selatan, memiliki struktur organisasi",
                          "yayasan mitra Huseda Sulawesi Selatan, memiliki struktur organisasi",
                          "yayasan mitra Huseda Sulawesi Selatan, memiliki struktur organisasi",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Jika bantuan berupa transfer dana? Komitmen akan 2 direalisasikan segera dan dilaporkan realisasinya (Laporan Pertanggungjawaban/LPJ)',
                        texts: [
                          "Ya, berkomitmen",
                          "Ya, berkomitmen",
                          "Ya, berkomitmen",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Jika bantuan berupa transfer dana, maka berkomimen akan 3 merealisasikan sesuai dengan proposal usulkan dan yang disetujui dari pihak PLN',
                        texts: [
                          "Ya, berkomitmen",
                          "Ya, berkomitmen",
                          "Ya, berkomitmen",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Jika bantuan barang. Komitmen barang bantuan dipergunakan 4 untuk kemanfaatan kelompok/ masyarakat bukan untuk kepentingan pribadi',
                        texts: [
                          "Ya, berkomitmen",
                          "Ya, berkomitmen",
                          "Ya, berkomitmen",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Jika dibantu maka barang bantuan/bangunan/lokasi penerima bantuan akan dibranding Bantuan PLN Peduli',
                        texts: [
                          "Ya",
                          "Ya",
                          "Ya",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Berkomitmen kemanfaatan bantuan minimal dapat dipergunakan selama 5 tahun dan diharapkan dapat lebih.',
                        texts: [
                          "Ya",
                          "Ya",
                          "Ya",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Jika sudah merealisasikan bantuan, maka penerima manfaat 7 wajib untuk menyampaikan laporan secara tertulis kepada PLN selambat-lambatnya 3 (tiga) bulan.',
                        texts: [
                          "Ya",
                          "Ya",
                          "Ya",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title: 'Apakah ada sumber dana lain selain dari PLN?',
                        texts: [
                          "untuk bantuan fasilitas 100% dari PLN tapi lembaga menyiapkan biaya operasional",
                          "untuk bantuan fasilitas 100% dari PLN tapi lembaga menyiapkan biaya operasional",
                          "untuk bantuan fasilitas 100% dari PLN tapi lembaga menyiapkan biaya operasional",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Diyakinkan dan dipastikan tidak ada overlap pendanaan.',
                        texts: [
                          "Tidak",
                          "Tidak",
                          "Tidak",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Apakah punya pengalaman dalam mengelola dana bantuan sebelumnya?',
                        texts: [
                          "Berpengalaman",
                          "Berpengalaman",
                          "Berpengalaman",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title: 'Apakah mempunyai ijin kegiatan organisasi?',
                        texts: [
                          "Ya",
                          "Ya",
                          "Ya",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title: 'Apakah mempunyai ijin pemanfaatan lahan?',
                        texts: [
                          "Ya",
                          "Ya",
                          "Ya",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title: 'Status kepelikan lahan?',
                        texts: [
                          "Milik Yayasan",
                          "Milik Yayasan",
                          "Milik Yayasan",
                        ]),
                    SizedBox(height: 18),
                    HasilTextContainer(
                        title:
                            'Apakah terdapat ketersediaan tenaga/vendor pelaksanaan bantuan?',
                        texts: [
                          "Ya",
                          "Ya",
                          "Ya",
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button (Left Side)
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            bottom: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
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
                                painter: BackArrowPainter(),
                              ),
                            ),
                          ),
                        ),

                        // Next Button (Right Side)
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.05,
                            bottom: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/hasilsurveye');
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
    home: HasilSurveyD(),
  ));
}
