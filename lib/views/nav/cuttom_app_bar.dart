import 'package:final_quran_app/constens/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatefulWidget {
  final bool darkMode;
  final void Function()? onTap;
  final void Function()? onTapBack;
  final String text;

  const CustomAppBar({
    super.key,
    this.onTap,
    required this.darkMode,
    this.onTapBack,
    required this.text,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.onTap,  // Correct onTap event
            child: SvgPicture.asset(
              widget.darkMode ? AppAssets.moon : AppAssets.sun,
              width: 25,
              height: 25,
              color: widget.darkMode ? Colors.black : Colors.white,
            ),
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: Color(0xFF783DAF),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          InkWell(
            onTap: widget.onTapBack,
            child: SvgPicture.asset(
              "assets/svgs/back.svg",
              width: 25,
              height: 25,
              color: widget.darkMode ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}





