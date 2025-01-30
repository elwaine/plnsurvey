import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/customcheckbox.dart';
import 'package:plnsurvey/ui/widgets/radiocontainer.dart';
import 'package:plnsurvey/ui/widgets/radiolainny.dart';
import 'package:plnsurvey/ui/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plnsurvey/ui/widgets/radiobuttonlist.dart';
import 'package:google_fonts/google_fonts.dart';

class Headerb extends StatelessWidget {
  const Headerb({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 125,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: screenWidth,
            height: 60,
            color: kPrimaryColor,
          ),
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

class SurveyB extends StatefulWidget {
  @override
  _SurveyBState createState() => _SurveyBState();
}

class _SurveyBState extends State<SurveyB> {
  String jenisBantuan = "";
  String koordinat = "";
  String day = '';
  String month = '';
  String year = '';

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
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
          Headerb(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRadioContainer(
                      title:
                          "Melengkapi Akta Pendirian Yayasan organisasi yang bergerak dalam bidang 1 Pendidikan Agama/ Social Lingkungan atau Dokumen Perijinan resmi dan Dinas/Departemen terkait",
                      hintText: "Specify",
                      options: [
                        "Ya",
                        "Tidak",
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomRadioContainer(
                      title: "Jika Bangunan, dilampirkan : ",
                      child: Container(
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
                              height: 1.7,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      'A. Kepemilikan tanah lahan (SHM, surat hibah/wakaf, SHGB, dll) yang ditandatangani pejabat yang berwenang.\n'),
                              TextSpan(
                                  text:
                                      'B. Legalitas untuk pembangunan agar dilengkapi (IMB, Amdal, dll).'),
                            ],
                          ),
                        ),
                      ),
                      hintText: "Specify",
                      options: ["Ya", "Tidak"],
                    ),
                    SizedBox(height: 16),
                    CustomRadioContainer(
                      title: "Syarat jika bantuan mobil/motor : ",
                      child: Container(
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
                              TextSpan(text: 'a. Surat keterangan domisili\n'),
                              TextSpan(text: 'b. Surat Kuasa Asli\n'),
                              TextSpan(text: 'c. NPWP Asli\n'),
                              TextSpan(
                                  text: 'd. Akta pendirian copy 2 legalisir\n'),
                              TextSpan(text: 'e. Tanda daftar Yayasan\n'),
                              TextSpan(
                                  text:
                                      'f. Bukti pendirian yayasan/akta Yayasan bidang Kesehatan untuk permintaan bantuan mobil ambulance.'),
                            ],
                          ),
                        ),
                      ),
                      hintText: "Specify",
                      options: ["Ya", "Tidak"],
                    ),
                    SizedBox(height: 16),
                    CustomCheckboxContainer(
                      title: "Informasi lainnya:",
                      options: [
                        'Surveyor menanyakan beberapa pertanyaan diatas',
                        'Melampirkan dokumen tersebut diatas',
                        'NPWP Asli',
                        'Akta pendirian copy 2 legalisir',
                        'Tanda daftar Yayasan',
                        'Bukti pendirian yayasan/akta Yayasan bidang Kesehatan untuk permintaan bantuan mobil ambulance.',
                      ],
                      onChanged: (selectedOptions) {
                        print("Selected options: \$selectedOptions");
                      },
                    ),
                    SizedBox(height: 16),
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
                                    blurRadius: 4,
                                    spreadRadius: 2,
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
                              Navigator.pushNamed(context, '/surveyd');
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
                                    blurRadius: 4,
                                    spreadRadius: 2,
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
    );
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
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
      ..strokeWidth = 4
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
    home: SurveyB(),
  ));
}
