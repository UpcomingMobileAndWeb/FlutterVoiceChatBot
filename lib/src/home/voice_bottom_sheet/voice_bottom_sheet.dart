import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_voice_chat/src/constants/constants.dart';
import 'package:flutter_voice_chat/src/home/home_model.dart';
import 'package:flutter_voice_chat/src/widgets/voice_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

showListenBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    //useSafeArea: true,
    builder: (_) => const ListenWidget(),
  );
}

class ListenWidget extends StatelessWidget {
  const ListenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Consumer<HomeModelProvider>(
        builder: (BuildContext context, value, Widget? child) {
          final inputType = value.inputType;
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                  ),
                  child: (inputType == InputType.text)
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 30,
                                bottom: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Upgrade for offline use',
                                    style: GoogleFonts.chivo(
                                      fontSize: 11,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              style: GoogleFonts.chivo(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor,
                              ),
                              decoration: InputDecoration(
                                hintText: 'You can type here or speak',
                                hintStyle: GoogleFonts.chivo(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: hintTextColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    color: Color(0xff8A8A8A),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: primaryColor,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 20,
                                ),
                              ),
                              onChanged: value.setTest,
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 63,
                                bottom: 20,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/ic_triangle.svg'),
                                  const SizedBox(
                                    width: 6.5,
                                  ),
                                  SvgPicture.asset('assets/ic_circle.svg'),
                                  const SizedBox(
                                    width: 6.5,
                                  ),
                                  SvgPicture.asset('assets/ic_square.svg'),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hold down to speak. I’m listening !',
                                  style: GoogleFonts.chivo(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: hintTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 19,
                                bottom: 21,
                              ),
                              child: VoiceButton(
                                size: 58,
                                iconSize: 23,
                                onTap: () {
                                  value.switchInputType();
                                },
                                iconColor: Colors.white,
                                showBorder: false,
                                isLoading: false,
                                backgroundColor: primaryColor,
                                showShadow: false,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              VoiceButton(
                size: 55,
                iconSize: 23,
                onTap: () {
                  if (inputType != InputType.speak) {
                    value.switchInputType();
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
