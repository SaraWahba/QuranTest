import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/views/nav/cuttom_app_bar.dart';
import 'package:final_quran_app/views/pray/pray_details.dart';
import 'package:final_quran_app/views/pray/pray_prophetic_details.dart';
import 'package:final_quran_app/widgets/azkar/custom_container_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PrayView extends StatefulWidget {
  const PrayView({super.key});

  @override
  State<PrayView> createState() => _PrayViewState();
}

class _PrayViewState extends State<PrayView> {
  late bool darkMode ;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit , ThemeData >(
      builder: (context, theme) {
        darkMode = theme.brightness == Brightness.dark ;
        return SafeArea(
          child: Scaffold(
            backgroundColor: darkMode ? colorLight : colorDark,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomAppBar(
                    darkMode: darkMode,
                    text: "الأدعية",
                    onTap: () {
                      context.read<ThemeCubit>(). toggleTheme();
                    },
                    onTapBack: (){
                      Navigator.pop(context, darkMode);
                    },
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        CustomContainerName(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => PrayDetails()),
                            );
                          },
                          color: darkMode ? const Color(0xFFFFF4D6) : const Color(0xFF665831),
                          colorName: darkMode ? Colors.black : Colors.white,
                          name: "أدعية قرآنية",
                          image: "assets/images/sun.png",
                        ),
                        const SizedBox(height: 15),
                        CustomContainerName(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => PrayPropheticDetails()),
                            );
                          },
                          color: darkMode ? const Color(0xFFE2DAFF) : const Color(0xFF423374),
                          colorName: darkMode ? Colors.black : Colors.white,
                          name: "أدعية نبوية",
                          image: "assets/images/illustration.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


