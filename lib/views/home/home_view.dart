import 'package:adhan/adhan.dart';
import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/views/fav_view.dart';
import 'package:final_quran_app/views/pray/pray_view.dart';
import 'package:final_quran_app/views/quran/quran_view.dart';
import 'package:final_quran_app/views/ruqyah/ruqyah_view.dart';
import 'package:final_quran_app/widgets/home/custom_container_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.themeAppHome, required this.onTap});

  final bool themeAppHome;
  final void Function(int indexPage) onTap ;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  PrayerTimes ?  times;

  double ? lng , lat ;

  @override
  void initState() {
    getPrayerTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //0xFF04112F
      backgroundColor: widget.themeAppHome ? colorLight : colorDark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     InkWell(
            //       onTap:(){
            //         setState(() {
            //           widget.themeAppHome =! widget.themeAppHome ;
            //         });
            //       },
            //       child: SvgPicture.asset(
            //         widget.themeAppHome ?  AppAssets.moon : AppAssets.sun   ,
            //         width: 25,
            //         height: 25,
            //         color:  widget.themeAppHome ? Colors.black : Colors.white,
            //       ),
            //     ),
            //     SvgPicture.asset(
            //       "assets/svgs/notification.svg",
            //       width: 25,
            //       height: 25,
            //       color:  widget.themeAppHome ? Colors.black : Colors.white,
            //     ),
            //     Container(
            //       width: 100,
            //       height: 50,
            //     ),
            //     Text(
            //       "الرئيسية",
            //       style: TextStyle(
            //           color: Color(0xFFC68E59),
            //           fontWeight: FontWeight.bold,
            //           fontSize: 30),
            //     ),
            //     SvgPicture.asset(
            //       "assets/svgs/menu.svg",
            //       width: 25,
            //       height: 25,
            //       color:  widget.themeAppHome ? Colors.black : Colors.white,
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 185,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color:  widget.themeAppHome ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                    child: Image(image: AssetImage("assets/images/mohmed.jpeg"),fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                textDirection: ui.TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainerTime(namePrayer: "العشاء" , themeApp: widget.themeAppHome ,time: DateFormat.jm('ar').format(times!.isha)),
                  CustomContainerTime(namePrayer: "المغرب" , themeApp: widget.themeAppHome , time: DateFormat.jm('ar').format(times!.maghrib)),
                  CustomContainerTime(namePrayer: "العصر" , themeApp: widget.themeAppHome , time: DateFormat.jm('ar').format(times!.asr)),
                  CustomContainerTime(namePrayer: "الظهر" , themeApp: widget.themeAppHome , time: DateFormat.jm('ar').format(times!.dhuhr)),
                  CustomContainerTime(namePrayer: "الفجر" , themeApp: widget.themeAppHome , time: DateFormat.jm('ar').format(times!.fajr)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                textDirection: ui.TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      getPrayerTime();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      width: 145,
                      height: 35,
                      decoration: BoxDecoration(
                        color: widget.themeAppHome ?Color(0xFFEADAFF).withOpacity(.5) :Color(0xFF06163E),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        textDirection: ui.TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "تحديث المواقيت",
                            style: TextStyle(
                              color:  widget.themeAppHome ? Colors.black : Colors.white,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/svgs/arrow.svg",
                            width: 21,
                            height: 21,
                            color: Color(0xFFE28C65),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "الأقسام الرئيسية",
                    style: TextStyle(
                        color:  widget.themeAppHome ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Quran
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () {
                  widget.onTap(1);
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => QuranView()),
                  // );
                },
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 0,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: -19,
                        child: Image(
                          image: AssetImage("assets/images/reading.png"),
                          width: 140,
                          height: 135,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: widget.themeAppHome ? [
                              Color(0xFFAC57FB).withOpacity(.48),
                              Color(0xFFE2C2FF).withOpacity(.7),
                              Color(0xFFEADAFF),
                               // Color(0xFF082753).withOpacity(.6),
                               // Color(0xFFDABB97).withOpacity(.7),
                              // Color(0xFF082753).withOpacity(.9),
                              // Color(0xFFECC39A).withOpacity(.9),
                            ] : [
                              Color(0xFF202864),
                              Color(0xFF540cb9).withOpacity(.8),
                              Color(0xFF4c0fad),

                            ],
                          ),
                        ),
                      ),
                      Row(
                        textDirection: ui.TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "القرآن الكريم",
                            style: TextStyle(
                                color:  widget.themeAppHome ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          Image(
                            image: AssetImage("assets/images/reading.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ////////////
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                textDirection: ui.TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      widget.onTap(3);
                    },
                    child: Container(
                      height: 100,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: .5,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 30,
                            right: 105,
                            child: Image(
                              image: AssetImage("assets/images/tasbih.png"),
                              width: 70,
                              height: 70,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: widget.themeAppHome ? [
                                  Color(0xFFAC57FB).withOpacity(.48),
                                  Color(0xFFE2C2FF).withOpacity(.7),
                                  Color(0xFFEADAFF),
                                  // Color(0xFF082753).withOpacity(.6),
                                  // Color(0xFFDABB97).withOpacity(.7),
                                  // Color(0xFF082753).withOpacity(.9),
                                  // Color(0xFFECC39A).withOpacity(.9),
                                ] : [
                                  Color(0xFF202864),
                                  Color(0xFF540cb9).withOpacity(.8),
                                  Color(0xFF4c0fad),

                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/islam.png"),
                                  width: 60,
                                  height: 60,
                                ),
                                Text(
                                  "أذكار",
                                  style: TextStyle(
                                      color:  widget.themeAppHome ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PrayView()));
                    },
                    child: Container(
                      height: 100,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 18,
                            right: 92,
                            child: Image(
                              image: AssetImage("assets/images/moon.png"),
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: widget.themeAppHome ? [
                                  Color(0xFFAC57FB).withOpacity(.48),
                                  Color(0xFFE2C2FF).withOpacity(.7),
                                  Color(0xFFEADAFF),
                                  // Color(0xFF082753).withOpacity(.6),
                                  // Color(0xFFDABB97).withOpacity(.7),
                                  // Color(0xFF082753).withOpacity(.9),
                                  // Color(0xFFECC39A).withOpacity(.9),
                                ] : [
                                  Color(0xFF202864),
                                  Color(0xFF540cb9).withOpacity(.8),
                                  Color(0xFF4c0fad),

                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/pray.png"),
                                  width: 60,
                                  height: 60,
                                ),
                                Text(
                                  "أدعية",
                                  style: TextStyle(
                                      color:  widget.themeAppHome ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ////////
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                textDirection: ui.TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RuqyahView()),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            right: 95,
                            child: Image(
                              image: AssetImage("assets/images/quran.png"),
                              width: 90,
                              height: 90,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: widget.themeAppHome ? [
                                  Color(0xFFAC57FB).withOpacity(.48),
                                  Color(0xFFE2C2FF).withOpacity(.7),
                                  Color(0xFFEADAFF),
                                  // Color(0xFF082753).withOpacity(.6),
                                  // Color(0xFFDABB97).withOpacity(.7),
                                  // Color(0xFF082753).withOpacity(.9),
                                  // Color(0xFFECC39A).withOpacity(.9),
                                ] : [
                                  Color(0xFF202864),
                                  Color(0xFF540cb9).withOpacity(.8),
                                  Color(0xFF4c0fad),

                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/quran.png"),
                                  width: 60,
                                  height: 60,
                                ),
                                Text(
                                  "الرقية الشرعية",
                                  style: TextStyle(
                                      color:  widget.themeAppHome ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FavView()),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 17,
                            right: 98,
                            child: Image(
                              image: AssetImage("assets/images/favourites.png"),
                              width: 76,
                              height: 76,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 175,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: widget.themeAppHome ? [
                                  Color(0xFFAC57FB).withOpacity(.48),
                                  Color(0xFFE2C2FF).withOpacity(.7),
                                  Color(0xFFEADAFF),
                                  // Color(0xFF082753).withOpacity(.6),
                                  // Color(0xFFDABB97).withOpacity(.7),
                                  // Color(0xFF082753).withOpacity(.9),
                                  // Color(0xFFECC39A).withOpacity(.9),
                                ] : [
                                  Color(0xFF202864),
                                  Color(0xFF540cb9).withOpacity(.8),
                                  Color(0xFF4c0fad),

                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(
                                  image: AssetImage("assets/images/like.png"),
                                  width: 50,
                                  height: 50,
                                ),
                                Text(
                                  "قائمتي",
                                  style: TextStyle(
                                      color:  widget.themeAppHome ? Colors.black : Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getPrayerTime() {

    // await getLocation();
    print(lat);
    print(lng);
    // final newYork = Coordinates(35.7750, -78.6336);
    final myCoordinates = Coordinates( 35.7750 ,-78.6336); // Replace with your own location lat, lng.
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    print("---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
    print(DateFormat.jm().format(prayerTimes.fajr));
    // print(DateFormat.jm().format(prayerTimes.sunrise));
    print(DateFormat.jm().format(prayerTimes.dhuhr));
    print(DateFormat.jm().format(prayerTimes.asr));
    print(DateFormat.jm().format(prayerTimes.maghrib));
    print(DateFormat.jm().format(prayerTimes.isha));

    setState(() {
      times = prayerTimes ;
    });
  }

  // Future<void> getLocation() async {
  //   Location location = new Location();
  //
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //   setState(() {
  //     lat = _locationData.latitude ;
  //     lng = _locationData.longitude ;
  //
  //     print(lat);
  //     print(lng);
  //   });
  // }

}
