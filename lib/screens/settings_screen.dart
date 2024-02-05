import 'package:assignment_one/widgets/font_tab.dart';
import 'package:assignment_one/widgets/laguage_tab.dart';
import 'package:assignment_one/widgets/phone_tab.dart';
import 'package:assignment_one/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController fontController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: nomal,
        ),
        actions: const [Icon(Icons.keyboard), Icon(Icons.arrow_drop_down)],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: media.height,
        width: media.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Offline  Themes", style: nomal),
            const Divider(thickness: 2),
            TabOne(),
            const SizedBox(
              height: 10,
            ),
            const Divider(thickness: 2),
            TabTwo(),
            const Divider(thickness: 2),
            const TabThree(),
            const Divider(thickness: 2),
          ],
        ),
      ),
    );
  }
}
