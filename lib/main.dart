import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/home_page_view.dart';
import 'package:final_quran_app/views/nav/nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit , ThemeData>(
        builder: (context, state) {
          return MaterialApp(
            theme: state,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('ar', ''), // اللغة العربية
              const Locale('en', ''), // اللغة الإنجليزية
            ],
            locale: const Locale('ar', ''), // تعيين اللغة الافتراضية إلى العربية
            debugShowCheckedModeBanner: false,
            home: HomePageView(),
          );
        },
      ),
    );
  }
}
