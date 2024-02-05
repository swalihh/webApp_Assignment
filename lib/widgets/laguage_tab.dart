// ignore_for_file: must_be_immutable

import 'package:assignment_one/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:assignment_one/constant/datas.dart';

class TabOne extends StatelessWidget {
  TabOne({super.key});
  TextEditingController languageController = TextEditingController();
  bool enableNotification = false;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: media.width / 6,
          child: Text(
            "Language :",
            style: rawTitle,
          ),
        ),
        Expanded(
            child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gmail display language :",
                        style: rawTitleBold,
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: media.width / 3,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              disabledBorder: InputBorder.none,
                              fillColor: Colors.transparent,
                              constraints: BoxConstraints(maxHeight: 50),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          value: null,
                          hint: Text(languages[0], style: rawTitle),
                          onChanged: (String? newValue) {
                            languageController.text = newValue ?? '';
                          },
                          items: languages.map((String language) {
                            return DropdownMenuItem<String>(
                              value: language,
                              child: Text(
                                textAlign: TextAlign.start,
                                language,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Change language settings for other Google products",
                    style: TextStyle(color: Colors.blue),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: enableNotification,
                        onChanged: (bool? newValue) {
                          // if (newValue != null) {
                          //   newValue = !enableNotification;
                          //   enableNotification = newValue;
                          // }
                        },
                      ),
                      Text(
                        "Enable input tools",
                        style: rawTitleBold,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  ' Use various text input tools to type in the language of your choice - ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            TextSpan(
                              text: ' Edit tools - Learn more',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 1,
                        onChanged: (int? value) {},
                      ),
                      Text(
                        "Right-to-left editing support off",
                        style: rawTitleBold,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 0,
                        onChanged: (int? value) {},
                      ),
                      Text(
                        "Right-to-left editing support on",
                        style: rawTitleBold,
                      )
                    ],
                  ),
                ],
              )
            ]))
      ],
    );
  }
}
