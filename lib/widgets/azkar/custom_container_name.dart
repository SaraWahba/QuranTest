import 'package:flutter/material.dart';

class CustomContainerName extends StatelessWidget {
  const CustomContainerName({super.key, this.onTap, required this.color, required this.colorName, required this.name, required this.image});
  final void Function()? onTap ;
  final Color color  , colorName;
  final String name , image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                name,
                style: TextStyle(
                  color: colorName,
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),
            ),
            Image(
                image: AssetImage(image),
                width: 105,
                height: 110,
            ),
          ],
        ),
      ),
    );
  }
}
