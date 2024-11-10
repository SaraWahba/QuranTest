import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/models/quran_model.dart';
import 'package:final_quran_app/views/home/home_view.dart';
import 'package:final_quran_app/views/nav/cuttom_app_bar.dart';
import 'package:final_quran_app/widgets/quran/container_quran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
   late bool darkMode ;
   List<QuranModel> quranList = [] ;


  @override
  Widget build(BuildContext context) {
    for(var i in quranData){
      quranList.add(QuranModel.fromJson(i)) ;
    }
    return BlocBuilder<ThemeCubit , ThemeData>(
      builder: (context, theme) {
          darkMode = theme.brightness == Brightness.dark ;
          return SafeArea(
            child: Scaffold(
              backgroundColor: darkMode ? colorLight : colorDark,
              body: Column(
                children: [
                  Expanded(
                    child: ListView.separated (
                      itemCount: quranList.length,
                      itemBuilder: (context, index) {
                        return  ContainerQuran(quranModel: quranList[index] , themeAppQuran: darkMode,);
                      },
                      separatorBuilder: (context, index) {
                        return  Divider(
                          color: Colors.grey,
                          thickness: 2,
                          endIndent: 50,
                          indent: 50,
                        ) ;
                      },
                      // child: Column(
                      //   children: [
                      //     ContainerQuran(themeAppQuran: darkMode),
                      //
                      //   ],
                      // ),
                      
                    ),
                  )

                ],
              ),
            ),
          );
        },
    );
  }
}
