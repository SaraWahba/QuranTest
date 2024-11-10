import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/constens/pray_list.dart';
import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/models/pray_model.dart';
import 'package:final_quran_app/views/nav/cuttom_app_bar.dart';
import 'package:final_quran_app/widgets/pray/custom_container_pray.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class PrayDetails extends StatefulWidget {
  // final bool themeApp;

  const PrayDetails({super.key});

  @override
  State<PrayDetails> createState() => _PrayDetailsState();
}

class _PrayDetailsState extends State<PrayDetails> {
  late bool darkMode ;  // Track darkMode state here
  
  List<PrayModel> prayList = [] ;
  @override
  void initState() {
    for (var i in prayData) {
      prayList.add(PrayModel.fromJson(i));
    }
    super.initState();
  }

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
                 text: "الأدعية القرآنية",// Pass darkMode to Nav
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
               Expanded(
                 child: ListView.separated(
                     itemCount: prayList.length ,
                     itemBuilder:(context, index) {
                       return CustomContainerPray(
                         prayModel: prayList[index],
                         themeApp: darkMode,
                       );
                     },
                     separatorBuilder:(context, index) {
                       // return  Divider(
                       //   color: Colors.grey,
                       //   thickness: 2,
                       //   endIndent: 50,
                       //   indent: 50,
                       // ) ;
                       return SizedBox(height: 15);
                     },
                 ),
               ),

             ],
           ),
         ),
       ) ;
     },
    );
  }
}

