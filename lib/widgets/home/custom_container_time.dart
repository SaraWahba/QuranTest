import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomContainerTime extends StatelessWidget {
  const CustomContainerTime(
      {super.key, required this.namePrayer, required this.themeApp, this.time});

  final String namePrayer;
  final bool themeApp;
  final String? time ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: themeApp
              ? [
                  Color(0xFFAC57FB).withOpacity(.5),
                  Color(0xFFE2C2FF).withOpacity(.6),
                  Color(0xFFEADAFF).withOpacity(.5),
                ]
              : [
            Color(0xFF202864),
            Color(0xFF540cb9).withOpacity(.8),
            Color(0xFF4c0fad),
                ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            time! ,
            style: TextStyle(
              color:  themeApp ? Colors.black : Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            //0xFF783DAF
            namePrayer,
            style: TextStyle(
              color: themeApp ? Color(0xFF783DAF) : Color(0xFFE28C65) ,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
