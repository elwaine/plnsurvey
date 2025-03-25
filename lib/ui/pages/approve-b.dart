import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/customcheckbox.dart';
import 'package:plnsurvey/ui/widgets/radiocontainer.dart';
import 'package:plnsurvey/ui/widgets/radiolainny.dart';
import 'package:plnsurvey/ui/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plnsurvey/ui/widgets/radiobuttonlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class ApproveB extends StatefulWidget {
  @override
  _ApproveBState createState() => _ApproveBState();
}

class _ApproveBState extends State<ApproveB> {
  String jenisBantuan = "";
  String koordinat = "";
  String informasiLainnya = "";
  bool isSubmitted = false;

  @override
  void initState() {
    super.initState();
    _loadSavedResponses();
  }

  // Load saved responses from shared_preferences
  Future<void> _loadSavedResponses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      jenisBantuan = prefs.getString("jenisBantuan") ?? "";
      koordinat = prefs.getString("koordinat") ?? "";
      informasiLainnya = prefs.getString("informasiLainnya") ?? "";
      isSubmitted = prefs.getBool("isSubmitted") ?? false;
    });
  }

  // Save responses locally
  Future<void> _saveResponses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("jenisBantuan", jenisBantuan);
    await prefs.setString("koordinat", koordinat);
    await prefs.setString("informasiLainnya", informasiLainnya);
  }

  // Submit form (locks editing)
  Future<void> _submitForm() async {
    await _saveResponses();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isSubmitted", true);
    setState(() {
      isSubmitted = true;
    });
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
                      title: "Jenis Bantuan",
                      hintText: "Specify",
                      options: ["Ya", "Tidak"],
                      isDisabled: isSubmitted,
                      onChanged: (value) {
                        if (!isSubmitted) {
                          setState(() {
                            jenisBantuan = value ?? "Ya";
                          });
                        }
                      },
                      selectedValue: jenisBantuan,
                    ),
                    SizedBox(height: 16),
                    CustomRadioContainer(
                      title: "Koordinat Lokasi",
                      hintText: "Masukkan Koordinat",
                      options: ["Ya", "Tidak"],
                      isDisabled: isSubmitted,
                      onChanged: (value) {
                        if (!isSubmitted) {
                          setState(() {
                            koordinat = value ?? "Ya";
                          });
                        }
                      },
                      selectedValue: koordinat,
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
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: SurveyTextFormField(
                        title: "Informasi Lainnya",
                        hintText: "Masukkan Catatan (jika ada)",
                        controller:
                            TextEditingController(text: informasiLainnya),
                        isDisabled: isSubmitted,
                        onChanged: (value) {
                          if (!isSubmitted) {
                            setState(() {
                              informasiLainnya = value;
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    isSubmitted
                        ? Text("Survey telah dikirim!",
                            style: TextStyle(color: Colors.green))
                        : ElevatedButton(
                            onPressed: _submitForm,
                            child: Text("Kirim"),
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
    home: ApproveB(),
  ));
}
