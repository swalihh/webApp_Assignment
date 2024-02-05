import 'package:assignment_one/constant/datas.dart';
import 'package:assignment_one/constant/text_styles.dart';
import 'package:flutter/material.dart';

class TabTwo extends StatelessWidget {
  TabTwo({super.key});
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return SizedBox(
      height: media.height / 9,
      width: media.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: media.width / 6,
            child: Text(
              "Phone numbers :",
              style: rawTitle,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Text(
                "Default country code:",
                style: rawTitleBold,
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: media.width / 3,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  value: null,
                  onChanged: (String? newValue) {
                    phoneController.text = newValue ?? '';
                  },
                  hint: Text(countryNames[0], style: rawTitle),
                  items: countryNames.map((String language) {
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
          ))
        ],
      ),
    );
  }
}
