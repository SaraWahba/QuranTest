import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/models/quran_model.dart';
import 'package:final_quran_app/views/nav/cuttom_app_bar.dart';
import 'package:final_quran_app/widgets/quran/container_quran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  late bool darkMode;



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        darkMode = theme.brightness == Brightness.dark;
        return SafeArea(
          child: Scaffold(
            backgroundColor: darkMode ? colorLight : colorDark,
            body: Column(
              children: [
                CustomAppBar(
                  darkMode: darkMode,
                  text: "قائمتي المفضلة",
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  onTapBack: () {
                    Navigator.pop(context, darkMode);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
