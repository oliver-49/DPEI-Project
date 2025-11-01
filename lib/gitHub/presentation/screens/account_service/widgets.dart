import 'package:flutter/material.dart';

Widget containerItem({
  required String text1,
  required String text2,
  required bool isSelected,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);
        final screenWidth = mediaQuery.size.width;
        final screenHeight = mediaQuery.size.height;

        return Container(
          
          width: screenWidth * 0.85, 
          height: screenHeight * 0.18, 
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: isSelected ? Color(0xff0773DA).withOpacity(0.10) : Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isSelected ? const Color(0xff0054A5) : const Color(0x260773DA),
              width: 2,
            ),
          ),
          child: Padding(
    
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08, 
              vertical: screenHeight * 0.03, 
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                     
                        fontSize: screenWidth * 0.06,
                        height: 1.0,
                        letterSpacing: 0,
                        color: Color(0xff565656),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.008), 
                    Text(
                      text2,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                       
                        fontSize: screenWidth * 0.035,
                        height: 1.0,
                        letterSpacing: 0,
                        color: Color(0xff565656),
                      ),
                    ),
                  ],
                ),
                if (isSelected)
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.005),
                    child: const Icon(Icons.check, color: Color(0xff0054A5)),
                  ),
              ],
            ),
          ),
        );
      },
    ),
  );
}