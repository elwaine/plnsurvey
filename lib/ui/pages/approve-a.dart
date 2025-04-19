import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/customcheckbox_no_title.dart';
import 'package:plnsurvey/ui/widgets/radiolainny.dart';
import 'package:plnsurvey/ui/widgets/radiolainny_no_title.dart';
import 'package:plnsurvey/ui/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plnsurvey/ui/widgets/radiobuttonlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plnsurvey/ui/widgets/textfield_no_title.dart';

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
              width: screenWidth * 0.8,
              height: 130,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenWidth * 0.5),
                  bottomRight: Radius.circular(screenWidth * 0.5),
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
                  Positioned(
                    left: screenWidth * 0.59,
                    top: 45,
                    child: IconButton(
                      icon: Icon(Icons.download_rounded, color: Colors.white),
                      onPressed: () => {},
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
  String? _selectedImageName;

  Future<String?> _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return image?.name; // Return file name
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        // Gradient Background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffDAF8FF), // Top color
                Color(0xFFFFFFFF), // Bottom color
              ],
            ),
          ),
        ),

        Column(
          children: [
            CustomHeader(),
            Align(
              alignment: Alignment.topRight,
              heightFactor: 0,
              child: Transform.translate(
                offset: const Offset(-4, -70),
                child: Image.asset(
                  'assets/logo_plnpedulis.png',
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.152,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              heightFactor: 0,
              child: Transform.translate(
                offset: const Offset(10, 50),
                child: Image.asset(
                  'assets/top_circle_1.png',
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.4,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              heightFactor: 0,
              child: Transform.translate(
                offset: const Offset(-70, 300),
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/mid_circle_1.png',
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildQuestionContainer(
                        number: 1,
                        title: "Nama program",
                        child: SurveyTextField(
                          hintText: "Masukkan Nama Program",
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildQuestionContainer(
                        number: 2,
                        title: "Jenis bantuan",
                        child: CustomRadioButtonns(
                          hintText: "-",
                          options: [
                            "Bantuan Fisik",
                            "Bantuan Non Fisik",
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
                          title: "3.  Alamat Denah",
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
                              "4.  Tanggal Survey",
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
                          title: "5.  Jarak Dari PLN Terdekat",
                          hintText: "-",
                        ),
                      ),
                      SizedBox(height: 16),
                      CustomRadioButtonz(
                        title: "6.  Kepemilikan Aset Bantuan (bantuan fisik)",
                        hintText: "-",
                        options: [
                          "Tanah Pribadi",
                          "Lahan Pribadi",
                          "Kepemilikan Masyarakat/Komunitas"
                        ],
                        extraOptionLabel: "Lainnya : ____________________",
                        onChanged: (value) {
                          print("Selected: $value");
                        },
                      ),
                      SizedBox(height: 16),
                      CustomRadioButtonz(
                        title: "7.  Keberlanjutan Bantuan",
                        hintText: "-",
                        options: [
                          "Dikelola Pribadi",
                          "Dikelola Masyarakat/Komunitas"
                        ],
                        extraOptionLabel: "Lainnya : ____________________",
                        onChanged: (value) {
                          print("Selected: $value");
                        },
                      ),
                      SizedBox(height: 16),
                      CustomRadioButtonz(
                        title: "8.  Sumber dana bantuan untuk program ini",
                        hintText: "-",
                        options: [
                          "Donatur dari beberapa institusi BUMN/pemerintah",
                          "Dari PLN",
                          "Ada kontribusi masyarakat"
                        ],
                        extraOptionLabel: "Lainnya : ____________________",
                        onChanged: (value) {
                          print("Selected: $value");
                        },
                      ),
                      SizedBox(height: 16),
                      _buildQuestionContainer(
                        number: 9,
                        title: "Potensi pengembangan program untuk Citra PLN",
                        child: CustomCheckboxz(
                          options: [
                            "Kesediaan dibangun papan nama “BANTUAN PLN”",
                            "Kesediaan  memberikan nama program yang memberikan karakter PLN"
                          ],
                          extraOptionLabel: "Lainnya : ____________________",
                          onChanged: (value) {
                            print("Selected: $value");
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildQuestionContainer(
                        number: 10,
                        title: "Manfaat untuk Masyarakat",
                        child: CustomCheckboxz(
                          options: [
                            "Sistem pengelolaan sampah yang baik, sehingga meningkatkan kesehatan masyarakat dan kelestarian lingkungan",
                            "Mendukung program kebersihan dan kampanye lingkungan"
                          ],
                          onChanged: (value) {
                            print("Selected: $value");
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildQuestionContainer(
                        number: 11,
                        title: "Manfaat untuk PLN",
                        child: CustomCheckboxz(
                          options: [
                            "Meningkatkan Citra Perusahaan",
                            "Meningkatkan hubungan baik dengan stakeholder",
                            "Mendapatkan dukungan dan masyarakat luas khususnya yang tersentuh dengan bantuan yang diberikan baik secara langsung maupun tidak langsung"
                          ],
                          onChanged: (value) {
                            print("Selected: $value");
                          },
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
                          title: "12.  Titik Koordinat",
                          hintText: "-",
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "14.  Alamat Denah",
                              style: darkblueTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                // "Text field" displaying image name
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF2F8F9),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      _selectedImageName ?? "-",
                                      style: TextStyle(
                                        color: _selectedImageName != null
                                            ? Colors.black
                                            : Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                // Upload Button
                                TextButton(
                                  onPressed: () async {
                                    String? imageName =
                                        await _pickImageFromGallery();
                                    if (imageName != null) {
                                      setState(() {
                                        _selectedImageName = imageName;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Upload Foto",
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                              "15.  Hal lain yang ingin disampaikan",
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
                                  title: "Potensi Keberlanjutan :",
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
                              Navigator.pushNamed(context, '/approveb');
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
      ]),
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
                    fontSize: 15, fontWeight: FontWeight.w900),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  title,
                  style: darkblueTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w900),
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ApproveA(),
  ));
}
