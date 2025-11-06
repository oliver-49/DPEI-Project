import 'package:flutter/material.dart';

class customSkill extends StatelessWidget {
  String txt;
  final Color? color;
  void Function()? onTap;

  customSkill({super.key, required this.txt,this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 65,
        height: 30,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 4,
              color: Color.fromARGB(255, 216, 214, 214),
            ),
          ],
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}