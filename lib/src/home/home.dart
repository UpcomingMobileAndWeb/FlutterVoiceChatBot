import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_voice_chat/src/constants/constants.dart';
import 'package:flutter_voice_chat/src/home/voice_bottom_sheet/voice_bottom_sheet.dart';
import 'package:flutter_voice_chat/src/widgets/voice_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 71),
              child: SvgPicture.asset('assets/logo.svg'),
            ),
            Center(
              child: Text(
                'Practice your speaking,\nlistening, reading and writing\nin one app.',
                style: GoogleFonts.chivo(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: darkTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Speak or type in your\npreferred language\nto start.',
                  style: GoogleFonts.chivo(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: lightTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 125,
                  ),
                  child: VoiceButton(
                    size: 89,
                    iconSize: 38,
                    onTap: () {
                      showListenBottomSheet(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
