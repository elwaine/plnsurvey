import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
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

class ApproveA extends StatefulWidget {
  @override
  _ApproveAState createState() => _ApproveAState();
}

class _ApproveAState extends State<ApproveA> {
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
                      child: SurveyTextFormField(
                        title: "Nama Program",
                        hintText: "Masukkan Nama Program",
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomRadioButton(
                      title: "Jenis Bantuan",
                      hintText: "Pilih Jenis Bantuan",
                      choice: jenisBantuan,
                      obscureText: false,
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
                        title: "Alamat Denah",
                        hintText: "Masukkan Alamat Denah",
                      ),
                    ),
                    SizedBox(height: 18),

                    // Tanggal Survey Section
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Survey",
                            style: darkblueTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Day Input
                              Flexible(
                                flex: 2,
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      day = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "DD",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffF2F8F9),
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "/",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kSurveyFontColor,
                                ),
                              ),
                              SizedBox(width: 8),
                              // Month Input
                              Flexible(
                                flex: 3,
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      month = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "MM",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffF2F8F9),
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor,
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "/",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: kSurveyFontColor,
                                ),
                              ),
                              SizedBox(width: 8),
                              // Year Input
                              Flexible(
                                flex: 3,
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      year = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "YYYY",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Color(0xffF2F8F9),
                                  ),
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                        title: "Jarak Dari PLN Terdekat",
                        hintText: "-",
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomRadioButtonz(
                      title: "Kepemilikan Aset Bantuan (bantuan fisik)",
                      hintText: "Specify",
                      options: [
                        "Tanah Pribadi",
                        "Lahan Pribadi",
                        "Kepemilikan Masyarakat/Komunitas"
                      ],
                      extraOptionLabel: "Lainnya",
                      onChanged: (value) {
                        print("Selected: $value");
                      },
                    ),
                    SizedBox(height: 16),
                    CustomRadioButtonz(
                      title: "Keberlanjutan Bantuan",
                      hintText: "Specify",
                      options: [
                        "Dikelola Pribadi",
                        "Dikelola Masyarakat/Komunitas"
                      ],
                      extraOptionLabel: "Lainnya",
                      onChanged: (value) {
                        print("Selected: $value");
                      },
                    ),
                    SizedBox(height: 16),
                    CustomRadioButtonz(
                      title: "Sumber dana bantuan untuk program ini",
                      hintText: "Specify",
                      options: [
                        "Donatur dari beberapa institusi BUMN/pemerintah",
                        "Dari PLN",
                        "Ada kontribusi masyarakat"
                      ],
                      extraOptionLabel: "Lainnya",
                      onChanged: (value) {
                        print("Selected: $value");
                      },
                    ),
                    SizedBox(height: 16),
                    CustomRadioButtonz(
                      title: "Potensi pengembangan program untuk Citra PLN",
                      hintText: "Specify",
                      options: [
                        "Kesediaan dibangun papan nama “BANTUAN PLN”",
                        "Kesediaan  memberikan nama program yang memberikan karakter PLN"
                      ],
                      extraOptionLabel: "Lainnya",
                      onChanged: (value) {
                        print("Selected: $value");
                      },
                    ),
                    SizedBox(height: 16),
                    CustomRadioButtonz(
                      title: "Manfaat untuk Masyarakat",
                      hintText: "Specify",
                      options: [
                        "Sistem pengelolaan sampah yang baik, sehingga meningkatkan kesehatan masyarakat dan kelestarian lingkungan",
                        "Mendukung program kebersihan dan kampanye lingkungan"
                      ],
                      onChanged: (value) {
                        print("Selected: $value");
                      },
                    ),
                    SizedBox(height: 16),
                    CustomRadioButtonz(
                      title: "Manfaat untuk PLN",
                      hintText: "Specify",
                      options: [
                        "Meningkatkan Citra Perusahaan",
                        "Meningkatkan hubungan baik dengan stakeholder",
                        "Mendapatkan dukungan dan masyarakat luas khususnya yang tersentuh dengan bantuan yang diberikan baik secara langsung maupun tidak langsung"
                      ],
                      onChanged: (value) {
                        print("Selected: $value");
                      },
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
                        title: "Titik Koordinat",
                        hintText: "12833487380297502",
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
                      child: Column(children: [
                        SurveyTextFormField(
                          title: "Alamat Denah",
                          hintText: "Maukkan Alamat disini",
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _pickImageFromGallery,
                              child: Text("Pilih Gambar"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(height: 16),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hal lain yang ingin disampaikan",
                            textAlign: TextAlign.left,
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
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: SurveyTextFormField(
                                title: "Perkiraan Jumlah Penerima Manfaat",
                                hintText: "-",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: SurveyTextFormField(
                                title: "Potensi Keberlanjutan",
                                hintText: "-",
                              ),
                            ),
                          ),
                        ],
                      ),
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
                            Navigator.pushNamed(context, '/surveyb');
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
    home: ApproveA(),
  ));
}
