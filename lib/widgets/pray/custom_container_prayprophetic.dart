import 'package:clipboard/clipboard.dart';
import 'package:final_quran_app/models/prayProphetic_model.dart';
import 'package:final_quran_app/models/pray_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;

class CustomContainerPrayProphetic extends StatelessWidget {
  const CustomContainerPrayProphetic({super.key, required this.themeApp, required this.prayProphetic});

  final bool themeApp;
  final PrayPropheticModel prayProphetic ;


  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeApp ? Color(0xFFDEDEDE) : Color(0xFF08163D) ,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                 Share.share(prayProphetic.text.toString());
                },
                child: SvgPicture.asset(
                  "assets/svgs/share.svg",
                  width: 28,
                  height: 28,
                  color: Color(0xFFD8963E),
                ),
              ),
              InkWell(
                onTap: () async {
                  // Copy the prayModel text to the clipboard
                  await FlutterClipboard.copy(prayProphetic.text.toString());

                  // Show a SnackBar confirming the copy action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,  // Allow floating behavior for margins
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 80), // Margins to position the SnackBar
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      content: Container(
                        width: 250, // Set a fixed width for the content
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5), // Add padding within the content
                        child: Text(
                          'تم النسخ',
                          textAlign: TextAlign.center, // Center the text
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  );


                },
                child: SvgPicture.asset(
                  "assets/svgs/copy.svg",
                  width: 28,
                  height: 28,
                  color: Color(0xFFD8963E),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 5),
              //   width: 170,
              //   height: 36,
              //   decoration: BoxDecoration(
              //     color: themeApp
              //         ?  Color(0xFFF0F0F0) :Color(0xFF172854),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Row(
              //     textDirection: ui.TextDirection.ltr,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         prayModel.numAyat.toString(),
              //         style: TextStyle(
              //           color: Color(0xFFD8963E),
              //           fontSize: 18,
              //         ),
              //       ),
              //       Text(
              //         "${prayModel.name.toString()} :  ",
              //         style: TextStyle(
              //           color: themeApp ? Colors.black : Colors.white ,
              //           fontSize: 18,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(width: 140),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 25,
                    height: 27,
                    child: Text(
                     prayProphetic.number.toString(),
                      style: TextStyle(
                          color: themeApp ? Colors.black : Colors.white, fontSize: 16),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/svgs/num-surah.svg",
                    width: 50,
                    height: 50,
                    color: Color(0xFF8A51B0),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            prayProphetic.text.toString(),
            style: TextStyle(
              color: themeApp ? Colors.black : Colors.white,
              fontSize: 22,
            ),
          ),
            Divider(
            color: Colors.grey,
            thickness: 2,
            endIndent: 50,
            indent: 50,
          ),
          Text(
            prayProphetic.dicer.toString(),
            style: TextStyle(
              color: Color(0xFFD8963E),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
