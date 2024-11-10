import 'package:audioplayers/audioplayers.dart';
import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/views/nav/cuttom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RuqyahView extends StatefulWidget {
  const RuqyahView({super.key});

  @override
  State<RuqyahView> createState() => _RuqyahViewState();
}

class _RuqyahViewState extends State<RuqyahView> {
 late bool darkMode ;
  double currentPlayback = 0;
  final player = AudioPlayer();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit , ThemeData>(
        builder: (context, theme) {
          darkMode = theme.brightness == Brightness.dark ;
          return SafeArea(
            child: Scaffold(
              backgroundColor: darkMode ? colorLight : colorDark,
              body: Column(
                children: [
                  CustomAppBar(
                    darkMode: darkMode,
                    text: "الرقية الشرعية",
                    onTap: () {
                      context.read<ThemeCubit>(). toggleTheme();
                      // setState(() {
                      //   darkMode = !darkMode;  // Toggle darkMode
                      // });
                    },
                    onTapBack: (){
                      Navigator.pop(context, darkMode);
                    },
                  ),
                  SizedBox(height: 80),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/images/mohmed.jpeg",
                      width: 350,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Summer",
                    style: TextStyle(
                      color: darkMode ? Colors.black : Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 60),
                  Slider(
                    value: currentPlayback,
                    onChanged: (value) {
                      setState(() {
                        currentPlayback = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "0:0",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "0:0",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/arrow-circle.svg",
                          width: 25,
                          height: 25,
                          color: darkMode ? Colors.black : Colors.white,
                        ),
                        SvgPicture.asset(
                          "assets/svgs/play-button.svg",
                          width: 25,
                          height: 25,
                          color: darkMode ? Colors.black : Colors.white,
                        ),
                        SvgPicture.asset(
                          "assets/svgs/arrow-circle-_1_.svg",
                          width: 25,
                          height: 25,
                          color: darkMode ? Colors.black : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}


