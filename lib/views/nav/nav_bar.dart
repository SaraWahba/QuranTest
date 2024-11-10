import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_quran_app/constens/app_assets.dart';
import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/views/azkar/azkar_view.dart';
import 'package:final_quran_app/views/home/home_view.dart';
import 'package:final_quran_app/views/quran/quran_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
 late bool darkMode  ;

   int currentPages =0;
   

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit , ThemeData>(
      builder: (context, theme) {
        darkMode = theme.brightness == Brightness.dark ;
        return SafeArea(
          child: Scaffold(
            backgroundColor: darkMode ? colorLight : colorDark,
            bottomNavigationBar:CurvedNavigationBar(
              index: currentPages,
              onTap: (value) {
                setState(() {
                  currentPages = value ;
                });
              },
              height: 67,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Color(0xFF6c48a0),
              color: darkMode ?Colors.grey:Color(0xFF142453),
              animationDuration: const Duration(milliseconds: 300),
              items:  <Widget>[
                //0xFF010816
                SvgPicture.asset(
                  "assets/svgs/home.svg",
                  width: 28,
                  height: 28,
                  fit: BoxFit.scaleDown,
                  color: Colors.white,
                ),
                SvgPicture.asset(
                  "assets/svgs/quran.svg",
                  width: 28,
                  height: 28,
                  fit: BoxFit.scaleDown,
                  color: Colors.white,
                ),
                SvgPicture.asset(
                  "assets/svgs/rosary.svg",
                  width: 28,
                  height: 28,
                  fit: BoxFit.scaleDown,
                  color: Colors.white,
                ),
                SvgPicture.asset(
                  "assets/svgs/praying.svg",
                  width: 28,
                  height: 28,
                  fit: BoxFit.scaleDown,
                  color: Colors.white,
                ),
              ],
            ),

            body: Column(
              children: [
                Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap:(){
                        context.read<ThemeCubit>(). toggleTheme();
                        // setState(() {
                        //   darkMode =! darkMode ;
                        // });
                      },
                      child: SvgPicture.asset(
                        darkMode ?  AppAssets.moon : AppAssets.sun   ,
                        width: 25,
                        height: 25,
                        color:  darkMode ? Colors.black : Colors.white,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/svgs/notification.svg",
                      width: 25,
                      height: 25,
                      color:  darkMode ? Colors.black : Colors.white,
                    ),
                    Container(
                      width: 100,
                      height: 50,
                    ),
                    Text(
                      currentPages == 0 ? "الرئسية" : currentPages == 1 ? "القرآن الكريم" : currentPages == 2 ? "السبحة" : "الأذكار",
                      style: TextStyle(
                          color: Color(0xFF783DAF),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                   InkWell (
                     onTap: ()=> ZoomDrawer.of(context)?.toggle(),
                      child: SvgPicture.asset(
                        "assets/svgs/menu.svg",
                        width: 25,
                        height: 25,
                        color:  darkMode ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
                Expanded(child: buildCreateBody(currentPages)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCreateBody(int currentPage) {
    switch(currentPage){
      case 0 :
        return HomeView(themeAppHome: darkMode , onTap: (indexPage) {
          setState(() {
            currentPages = indexPage ;
          });
        },);
      case 1 :
        return QuranView();
      case 2 :
        return  Container(
          child: Center(
            child: Text("3"),
          ),
        ) ;
      default :
        return AzkarView(themeAppAzkar: darkMode);
    };
  }
}
