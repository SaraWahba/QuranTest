import 'package:final_quran_app/drawer/menu_screen_page.dart';
import 'package:final_quran_app/views/home/home_view.dart';
import 'package:final_quran_app/views/nav/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  static String id = "HomePageView";

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    late bool darkMode  ;

    return ZoomDrawer(
        angle: 0,
        mainScreenScale: .1,
        borderRadius: 40,
        // showShadow: true,

        menuScreenWidth: MediaQuery.of(context).size.width,
        menuScreen: MenuScreenPage(),
        mainScreen: NavBar(),
       isRtl: true,

    );
  }
}
