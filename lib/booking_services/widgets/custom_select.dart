import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  const Select({
    super.key,
    required this.icon,
    required this.text,
    this.isSelected = false,
  });

  final IconData icon;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * .9,
      height: screenHeight * .075,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffE8F0FE) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: isSelected ? const Color(0xff2B54A4) : Colors.grey.shade400,
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: const Color(0xff2B54A4).withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xff2B54A4),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xff2B54A4) : Colors.black,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.check,
              color: isSelected ? const Color(0xff2B54A4) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
