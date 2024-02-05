import 'package:assignment_one/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabThree extends StatefulWidget {
  const TabThree({super.key});

  @override
  State<TabThree> createState() => _TabThreeState();
}

String fontStyle = "Outfit";

class _TabThreeState extends State<TabThree> {
  TextEditingController fontController = TextEditingController();
  List<double> fontSizeList = [12.0, 16.0, 20.0, 24.0];
  List<String> fontSizeName = ["Small", "Normal", "Large", "Huge"];
  double selectedFontSize = 16;
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return SizedBox(
      // height: media.height / 4,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: media.width / 7,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Default text style:\n",
                  style: rawTitleBold,
                ),
                const TextSpan(
                  text:
                      "(Use the 'Remove formatting' button on the toolbar to reset the default text style)",
                  style: TextStyle(fontSize: 10, letterSpacing: 1),
                ),
              ],
            ),
          ),
        ),
        Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.all(30),
            // height: media.height / 8,
            width: media.width / 3,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade300)),
            child: ListView(shrinkWrap: true, children: [
              Row(children: [
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField<String>(
                    value: null,
                    focusColor: Colors.transparent,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        fontController.text = newValue ?? '';
                        if (newValue != null) {
                          fontStyle = newValue;
                        }
                      });
                    },
                    hint: const Text("Sans Serif"),
                    items: GoogleFonts.asMap()
                        .keys
                        .take(10)
                        .map<DropdownMenuItem<String>>((String fontName) {
                      return DropdownMenuItem<String>(
                        value: fontName,
                        child: Text(
                          fontName,
                          style: GoogleFonts.getFont(fontName),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField<double>(
                    value: selectedFontSize,
                    focusColor: Colors.transparent,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    isExpanded: true,
                    onChanged: (double? newValue) {
                      selectedIndex = fontSizeList.indexOf(newValue ?? 16.0);
                      setState(() {
                        selectedFontSize = newValue ?? 16.0;
                      });
                    },
                    hint: const Icon(Icons.text_fields_outlined,
                        color: Colors.black),
                    items: fontSizeList
                        .map<DropdownMenuItem<double>>((double fontSize) {
                      return DropdownMenuItem<double>(
                        value: fontSize,
                        child: Text(
                          fontSizeName[fontSizeList.indexOf(fontSize)],
                          style: TextStyle(fontSize: fontSize),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.text_format_outlined),
                const Icon(Icons.arrow_drop_down_sharp),
                const SizedBox(width: 5),
                const Icon(Icons.format_clear),
              ]),
              Text("This is what your body text will look like.",
                  style: GoogleFonts.getFont(fontStyle,
                      fontSize: selectedFontSize))
            ]),
          )
        ])
      ]),
    );
  }
}
