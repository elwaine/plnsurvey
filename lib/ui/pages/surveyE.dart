import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_table.dart';
import 'package:plnsurvey/ui/widgets/customcheckbox.dart';
import 'package:plnsurvey/ui/widgets/customnotecard.dart';
import 'package:plnsurvey/ui/widgets/customrowradio.dart';
import 'package:plnsurvey/ui/widgets/radiocontainer.dart';
import 'package:plnsurvey/ui/widgets/radiolainny.dart';
import 'package:plnsurvey/ui/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plnsurvey/ui/widgets/radiobuttonlist.dart';
import 'package:google_fonts/google_fonts.dart';

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

class SurveyE extends StatefulWidget {
  @override
  _SurveyEState createState() => _SurveyEState();
}

class _SurveyEState extends State<SurveyE> {
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
                    SizedBox(height: 18),
                    CustomRowRadioButtonz(
                      title: "Kesimpulan",
                      hintText: "-",
                      options: ["Layak", "Tidak Layak"],
                      choice: null,
                      onChanged: (value) {
                        print("Selected: $value");
                      },
                    ),
                    SizedBox(height: 18),
                    SurveyNoteCard(
                      title: "Catatan Survey",
                      topContent:
                          "diperlukan jika program layak dibantu namun dengan catatan dan menjawab atau memastikan catatan di form evaluasi awal di lapangan",
                      bottomHintText: "Tambahkan catatan Anda di sini...",
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 18),
                    Column(
                      children: [SurveyTeamWidget()],
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
                      child: SurveyTextFormField(
                        title:
                            "Jika bantuan berupa transfer dana, maka berkomimen akan 3 merealisasikan sesuai dengan proposal usulkan dan yang disetujui dari pihak PLN",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title:
                            "Jika bantuan barang. Komitmen barang bantuan dipergunakan 4 untuk kemanfaatan kelompok/ masyarakat bukan untuk kepentingan pribadi",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title:
                            "Jika dibantu maka barang bantuan/bangunan/lokasi penerima bantuan akan dibranding Bantuan PLN Peduli",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title:
                            "Berkomitmen kemanfaatan bantuan minimal dapat dipergunakan selama 5 tahun dan diharapkan dapat lebih.",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title:
                            "Jika sudah merealisasikan bantuan, maka penerima manfaat 7 wajib untuk menyampaikan laporan secara tertulis kepada PLN selambat-lambatnya 3 (tiga) bulan",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title: "Apakah ada sumber dana lain selain dari PLN?",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title:
                            "Diyakinkan dan dipastikan tidak ada overlap pendanaan",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title:
                            "Apakah punya pengalaman dalam mengelola dana bantuan sebelumnya?",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title: "Apakah mempunyai ijin kegiatan organisasi?",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title: "Apakah mempunyai ijin pemanfaatan lahan?",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title: "Status kepelikan lahan?",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
                      child: SurveyTextFormField(
                        title:
                            "Apakah terdapat ketersediaan tenaga/vendor pelaksanaan bantuan?",
                        hintText: "Masukkan Jawaban Anda",
                      ),
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
    home: SurveyE(),
  ));
}
