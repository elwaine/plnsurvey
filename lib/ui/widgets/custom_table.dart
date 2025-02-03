import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_button_table.dart';
import 'package:plnsurvey/ui/widgets/tabeltextfield.dart';

class SurveyTeamWidget extends StatefulWidget {
  const SurveyTeamWidget({Key? key}) : super(key: key);

  @override
  State<SurveyTeamWidget> createState() => _SurveyTeamWidgetState();
}

class _SurveyTeamWidgetState extends State<SurveyTeamWidget> {
  final List<String> plnTeam = [];
  final List<String> externalTeam = [];

  void showAddMemberDialog(bool isPlnTeam) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.all(16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabelTextFormField(
              title: "Add Member",
              hintText: "Input member name",
              controller: controller,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButtonz(
                title: "Submit",
                onPressed: () {
                  if (controller.text.trim().isNotEmpty) {
                    setState(() {
                      if (isPlnTeam) {
                        plnTeam.add(controller.text.trim());
                      } else {
                        externalTeam.add(controller.text.trim());
                      }
                    });
                  }
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Tim Survey" Title
                Text(
                  "Tim Survey",
                  style: darkblueTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),

                // Table
                Table(
                  border: TableBorder.all(
                      color: kSurveyFontColor,
                      borderRadius: BorderRadius.circular(10),
                      width: 1.5),
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(3),
                  },
                  children: [
                    // Row 1: Headers
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Tim Survey PLN",
                            style: darkblueTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Tim Survey (luar)",
                            style: darkblueTextStyle.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Dynamic Rows
                    ...List.generate(
                      plnTeam.length > externalTeam.length
                          ? plnTeam.length
                          : externalTeam.length,
                      (index) => TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: index < plnTeam.length
                                ? Row(
                                    children: [
                                      Text(
                                        plnTeam[index],
                                        style: darkblueTextStyle.copyWith(
                                            fontSize: 15),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.image,
                                        color: kSurveyFontColor,
                                        size: 19,
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: index < externalTeam.length
                                ? Row(
                                    children: [
                                      Text(
                                        externalTeam[index],
                                        style: darkblueTextStyle.copyWith(
                                            fontSize: 15),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.image,
                                        color: kSurveyFontColor,
                                        size: 19,
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),

                    TableRow(
                      children: [
                        IconButton(
                          onPressed: () => showAddMemberDialog(true),
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: kSurveyFontColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () => showAddMemberDialog(false),
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: kSurveyFontColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
