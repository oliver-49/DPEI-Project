import 'package:flutter/material.dart';

class CustomReview extends StatelessWidget {
  String? image;
  String? name;
  String? date;
  String? text;
  IconData? icon;
  CustomReview({
    super.key,
    required this.date,
    required this.icon,
    required this.image,
    required this.name,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * .011),
        Row(
          children: [
            Container(
              width: screenWidth * .060,
              height: screenHeight * .060,
              child: Image.asset(image!),
            ),
            SizedBox(width: screenWidth * .012),
            Text(
              name!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(date!),
          ],
        ),
        Row(
          children: [
            Icon(
              icon,
              color: Color(0xff0054A5),
              shadows: [
                Shadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            Icon(icon, color: Color(0xff0054A5), shadows: [shadow]),
            Icon(icon, color: Color(0xff0054A5), shadows: [shadow]),
            Icon(icon, color: Color(0xff0054A5), shadows: [shadow]),
            Icon(icon, color: Colors.grey[200], shadows: [shadow]),
          ],
        ),
        Text(text!, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}

var shadow = Shadow(color: Colors.grey, offset: Offset(0, 3), blurRadius: 10);
