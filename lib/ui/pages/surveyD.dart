import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/customcheckbox.dart';
import 'package:plnsurvey/ui/widgets/radiocontainer.dart';
import 'package:plnsurvey/ui/widgets/radiolainny.dart';
import 'package:plnsurvey/ui/widgets/radiolainny_no_title.dart';
import 'package:plnsurvey/ui/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plnsurvey/ui/widgets/radiobuttonlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plnsurvey/ui/widgets/textfield_no_title.dart';

class Headerd extends StatelessWidget {
  const Headerd({super.key});

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

class SurveyD extends StatefulWidget {
  @override
  _SurveyDState createState() => _SurveyDState();
}

class _SurveyDState extends State<SurveyD> {
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
          Headerd(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildQuestionContainer(
                      number: 21,
                      title:
                          "Siapa pengelola bantuan? Apakah ada struktur organisasi pengelolanya?",
                      child: SurveyTextField(
                        hintText: "-",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 22,
                      title:
                          "Jika bantuan berupa transfer dana? Komitmen akan 2 direalisasikan segera dan dilaporkan realisasinya (Laporan Pertanggungjawaban/LPJ)",
                      child: CustomRadioButtonns(
                        options: ["Ya, berkomitmen", "Tidak berkomitmen"],
                        hintText: "-",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 23,
                      title:
                          "Jika bantuan berupa transfer dana, maka berkomimen akan merealisasikan sesuai dengan proposal usulkan dan yang disetujui dari pihak PLN",
                      child: CustomRadioButtonns(
                        options: ["Ya, berkomitmen", "Tidak berkomitmen"],
                        hintText: "-",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 24,
                      title:
                          "Jika bantuan barang. Komitmen barang bantuan dipergunakan 4 untuk kemanfaatan kelompok/masyarakat bukan untuk kepentingan pribadi",
                      child: CustomRadioButtonns(
                        options: ["Bersedia", "Tidak bersedia"],
                        hintText: "-",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 25,
                      title:
                          "Jika dibantu maka barang bantuan/bangunan/lokasi penerima bantuan akan dibranding Bantuan PLN Peduli",
                      child: CustomRadioButtonns(
                        options: ["Bersedia", "Tidak bersedia"],
                        hintText: "-",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 26,
                      title:
                          "Berkomitmen kemanfaatan bantuan minimal dapat dipergunakan selama 5 tahun dan diharapkan dapat lebih.",
                      child: CustomRadioButtonns(
                        options: ["Bersedia", "Tidak bersedia"],
                        hintText: "-",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 27,
                      title:
                          "Jika sudah merealisasikan bantuan, maka penerima manfaat 7 wajib untuk menyampaikan laporan secara tertulis kepada PLN selambat-lambatnya 3 (tiga) bulan",
                      child: CustomRadioButtonns(
                        options: ["Bersedia", "Tidak bersedia"],
                        hintText: "-",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 28,
                      title: "Apakah ada sumber dana lain selain dari PLN?",
                      child: SurveyTextField(
                        hintText: "Masukkan Jawaban Anda",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 29,
                      title:
                          "Diyakinkan dan dipastikan tidak ada overlap pendanaan",
                      child: CustomRadioButtonns(
                        options: ["Bersedia", "Tidak bersedia"],
                        hintText: "Masukkan Jawaban Anda",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 30,
                      title:
                          "Apakah punya pengalaman dalam mengelola dana bantuan sebelumnya?",
                      child: CustomRadioButtonns(
                        options: ["Berpengalaman", "Kurang berpengalaman"],
                        hintText: "Masukkan Jawaban Anda",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 31,
                      title: "Apakah mempunyai ijin kegiatan organisasi?",
                      child: CustomRadioButtonns(
                        options: ["Ya", "Tidak"],
                        hintText: "Masukkan Jawaban Anda",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 32,
                      title: "Apakah mempunyai ijin pemanfaatan lahan?",
                      child: CustomRadioButtonns(
                        options: ["Ya", "Tidak"],
                        hintText: "Masukkan Jawaban Anda",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 33,
                      title: "Status kepelikan lahan?",
                      child: CustomRadioButtonns(
                        options: ["Yayasan", "Masyarakat"],
                        extraOptionLabel: "Lainnya : ____________________",
                        onChanged: (value) {
                          print("Selected: $value");
                        },
                        hintText: "Masukkan Jawaban Anda",
                      ),
                    ),
                    SizedBox(height: 18),
                    _buildQuestionContainer(
                      number: 34,
                      title:
                          "Apakah terdapat ketersediaan tenaga/vendor pelaksanaan bantuan?",
                      child: CustomRadioButtonns(
                        options: ["Ya", "Tidak"],
                        hintText: "Masukkan Jawaban Anda",
                      ),
                    ),
                    SizedBox(height: 20),
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
                              Navigator.pushNamed(context, '/surveye');
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

  Widget _buildQuestionContainer({
    required int number,
    required String title,
    required Widget child,
  }) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$number. ", // Number
                style: darkblueTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  title,
                  style: darkblueTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          child,
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
    home: SurveyD(),
  ));
}
