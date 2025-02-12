import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class AddressFileWidget extends StatelessWidget {
  final String title;
  final List<String> files;
  final List<String> addresses;

  const AddressFileWidget({
    Key? key,
    required this.title,
    required this.files,
    required this.addresses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // **Title**
          Text(
            title,
            style: darkblueTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kSurveyFontColor, width: 1.5),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: kSurveyFontColor, width: 1.5),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "File",
                    style: darkblueTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: black,
                    ),
                  ),
                ),

                // **File List**
                ...files.map((file) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 13),
                    decoration: BoxDecoration(
                      color: Color(0xffF2F8F9),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.insert_drive_file_outlined,
                            color: kSurveyFontColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            file,
                            style: darkblueTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Column(
            children: addresses.map((address) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xffF2F8F9),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    address,
                    style: darkblueTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
