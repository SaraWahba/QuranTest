import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum AppTheme { light, dark }

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0XFFfcf4f4)
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: Color(0xFF0d1c46)
  );

  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      emit(_darkTheme);
    } else {
      emit(_lightTheme);
    }
  }
}