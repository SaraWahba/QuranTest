import 'package:final_quran_app/constens/Prayprophetic_list.dart';
import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/cubit/mytheme_cubit.dart';
import 'package:final_quran_app/models/prayProphetic_model.dart';
import 'package:final_quran_app/views/nav/cuttom_app_bar.dart';
import 'package:final_quran_app/widgets/pray/custom_container_prayprophetic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrayPropheticDetails extends StatefulWidget {
  const PrayPropheticDetails({super.key});
  // final bool themeApp;

  @override
  State<PrayPropheticDetails> createState() => _PrayPropheticDetailsState();
}

class _PrayPropheticDetailsState extends State<PrayPropheticDetails> {
  late bool darkMode ;
  List<PrayPropheticModel> prayPropheticList = [] ;

  @override
  void initState() {
    for (var i in prayPropheticData) {
      prayPropheticList.add(PrayPropheticModel.fromJson(i));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeCubit , ThemeData>(
      builder: (context , theme){
        darkMode = theme.brightness == Brightness.dark ;
        return SafeArea(
            child: Scaffold(
              backgroundColor: darkMode ?  colorLight : colorDark,
              body: Column(
                children: [
                  CustomAppBar(
                    darkMode: darkMode,
                    text: "الأدعية النبوية",// Pass darkMode to Nav
                    onTap: () {
                      context.read<ThemeCubit>(). toggleTheme();
                      // setState(() {
                      //   darkMode = !darkMode;  // Toggle theme when icon tapped
                      // });
                    },
                    onTapBack: () {
                      Navigator.pop(context , darkMode);
                    },
                  ),
                  Expanded(
                      child: ListView.separated(
                          itemCount: prayPropheticList.length  ,
                          itemBuilder: (context, index) {
                            return CustomContainerPrayProphetic(
                                themeApp: darkMode,
                                prayProphetic: prayPropheticList[index]
                            );
                          },
                          separatorBuilder: (context, index) {
                            // return  Divider(
                            //   color: Colors.grey,
                            //   thickness: 2,
                            //   endIndent: 50,
                            //   indent: 50,
                            // ) ;
                            return SizedBox(height: 15);
                          },
                      )
                  )
                ],
              ),
            )
        );
      }
    );
  }
}
