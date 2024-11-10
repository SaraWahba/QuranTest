import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuScreenPage extends StatelessWidget {
  const MenuScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF545454),
        body: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            padding: EdgeInsets.only(top: 55, right: 20),
            width: 270,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    child: Icon(Icons.close),
                    onTap: () => ZoomDrawer.of(context)!.close()),
                SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/mohmedicon.jpg"),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "فضيلة الشيخ محمد حسان",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: "Albattar",
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
