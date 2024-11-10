import 'package:final_quran_app/constens/constens.dart';
import 'package:final_quran_app/models/quran_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerQuran extends StatelessWidget {
  const ContainerQuran({super.key, required this.quranModel, required this.themeAppQuran});

  final bool themeAppQuran;
  final QuranModel quranModel ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric( vertical: 8),
      width: double.infinity,

      color: Colors.transparent,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                alignment: AlignmentDirectional.center,
                width: 30,
                height: 30,
                child: Text(
                  quranModel.nomor.toString(),
                  style: TextStyle(
                    color: themeAppQuran ? Colors.black : Colors.white
                  ,fontSize: 16),
                ),
              ),
              SvgPicture.asset(
                "assets/svgs/num-surah.svg",
                width: 50,
                height: 50,
                color: Color(0xFF7542A9),
              ),
            ],
          ),
          SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    quranModel.nama.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: themeAppQuran ? Colors.black : Colors.white
                    ),
                  ),
                  Text(
                    quranModel.namaLatin.toString(),
                    style: TextStyle(
                        color: Color(0xFF7542A9),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        quranModel.tempatTurun! == "mekah" ? "مكية" : "مدنية",
                        style: TextStyle(
                            fontSize: 16,
                            color: themeAppQuran ? Colors.black : Colors.white
                        ),
                      ),
                      SvgPicture.asset(
                          "assets/svgs/dot.svg",
                          width: 20,
                          height: 20,
                          color: themeAppQuran ? Colors.black : Colors.white
                      ),
                      Text(
                        " آياتها ${quranModel.jumlahAyat} آيه ",
                        style: TextStyle(
                            fontSize: 16,
                            color: themeAppQuran ? Colors.black : Colors.white
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed:(){},
                      icon:Icon(quranModel.fav ! ?Icons.favorite :Icons.favorite_border )
                  )
                ],
              ),
            ],
          ),
        )

        ],
      ),
    );
  }
}
