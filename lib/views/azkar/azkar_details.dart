import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/views/azkar/azkar_view.dart';
import 'package:final_quran_app/views/nav/cuttom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class AzkarDetails extends StatefulWidget {
  final bool themeApp;

  const AzkarDetails({super.key, required this.themeApp});

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  late bool darkMode ;  // Track darkMode state here

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit , ThemeData>(
     builder: (context, theme) {
       darkMode = theme.brightness == Brightness.dark ;
       return SafeArea(
         child: Scaffold(
           backgroundColor: darkMode ?  colorLight : colorDark,
           body: Column(
             children: [
               CustomAppBar(
                 darkMode: darkMode,
                 text: "أذكار",// Pass darkMode to Nav
                 onTap: () {
                   context.read<ThemeCubit>(). toggleTheme();
                   // setState(() {
                   //   darkMode = !darkMode;  // Toggle theme when icon tapped
                   // });
                 },
                 onTapBack: () {
                   Navigator.pop(context , darkMode);
                 },
               ),
               Container(
                 padding: EdgeInsets.all(16),
                 margin: EdgeInsets.symmetric(horizontal: 16),
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: darkMode ? Color(0xFFDEDEDE) : Color(0xFF08163D) ,
                   borderRadius: BorderRadius.circular(16),
                 ),
                 child: Column(
                   children: [
                     Row(
                       textDirection: TextDirection.ltr,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         SvgPicture.asset(
                           "assets/svgs/share.svg",
                           width: 28,
                           height: 28,
                           color: Color(0xFFD8963E),
                         ),
                         SvgPicture.asset(
                           "assets/svgs/copy.svg",
                           width: 28,
                           height: 28,
                           color: Color(0xFFD8963E),
                         ),
                         Container(
                           padding: EdgeInsets.symmetric(horizontal: 5),
                           width: 170,
                           height: 36,
                           decoration: BoxDecoration(
                             color: darkMode
                                 ? Color(0xFF172854)
                                 : Color(0xFFEADAFF).withOpacity(.5),
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child: Row(
                             textDirection: TextDirection.ltr,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(
                                 "1 ",
                                 style: TextStyle(
                                   color: Color(0xFFD8963E),
                                   fontSize: 18,
                                 ),
                               ),
                               Text(
                                 "عدد المرات : ",
                                 style: TextStyle(
                                   color: darkMode ? Colors.white : Colors.black,
                                   fontSize: 18,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Stack(
                           children: [
                             Positioned(
                               top: 12,
                               right: 13,
                               child: Container(
                                 alignment: AlignmentDirectional.center,
                                 width: 25,
                                 height: 27,
                                 child: Text(
                                   "23",
                                   style: TextStyle(
                                       color: Colors.white, fontSize: 16),
                                 ),
                               ),
                             ),
                             SvgPicture.asset(
                               "assets/svgs/num-surah.svg",
                               width: 50,
                               height: 50,
                               color: Color(0xFF7542A9),
                             ),
                           ],
                         ),
                       ],
                     ),
                     SizedBox(height: 10),
                     Text(
                       "أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله...",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 18.5,
                       ),
                     ),
                     SizedBox(height: 15,),
                     Align(
                       alignment: AlignmentDirectional.bottomEnd,
                       child: SvgPicture.asset(
                         "assets/svgs/mic.svg",
                         width: 27,
                         height: 27,
                         color: darkMode ? Colors.black : Colors.white,
                       ),
                     ),
                   ],
                 ),
               )
             ],
           ),
         ),
       ) ;
     },
    );
  }
}

