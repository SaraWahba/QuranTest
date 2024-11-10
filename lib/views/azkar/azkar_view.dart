import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/views/azkar/azkar_details.dart';
import 'package:final_quran_app/widgets/azkar/custom_container_name.dart';
import 'package:flutter/material.dart';

class AzkarView extends StatefulWidget {
  const AzkarView({super.key, required this.themeAppAzkar});

  final bool themeAppAzkar;

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {
  @override
  Widget build(BuildContext context) {
    // Centralize theme colors for easier modification and consistency
    Color backgroundColor = widget.themeAppAzkar ? colorLight : colorDark;
    Color textColor = widget.themeAppAzkar ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomContainerName(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AzkarDetails(themeApp: widget.themeAppAzkar)),
                  );
                },
                color: widget.themeAppAzkar ? const Color(0xFFFFF4D6) : const Color(0xFF665831),
                colorName: textColor,
                name: "أذكار الصباح",
                image: "assets/images/sun.png",
              ),
              const SizedBox(height: 15),
              CustomContainerName(
                color: widget.themeAppAzkar ? const Color(0xFFE2DAFF) : const Color(0xFF423374),
                colorName: textColor,
                name: "أذكار المساء",
                image: "assets/images/illustration.png",
              ),
              const SizedBox(height: 15),
              CustomContainerName(
                color: widget.themeAppAzkar ? const Color(0xFFFFE2DE) : const Color(0xFF432421),
                colorName: textColor,
                name: "أذكار الاستيقاظ",
                image: "assets/images/wakeup.png",
              ),
              const SizedBox(height: 15),
              CustomContainerName(
                color: widget.themeAppAzkar ? const Color(0xFFCFFCFF) : const Color(0xFF256064),
                colorName: textColor,
                name: "أذكار النوم",
                image: "assets/images/sleep.png",
              ),
              const SizedBox(height: 15),
              CustomContainerName(
                color: widget.themeAppAzkar ? const Color(0xFFDEEAFF) : const Color(0xFF18365C),
                colorName: textColor,
                name: "أذكار بعد الصلاة",
                image: "assets/images/after.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
