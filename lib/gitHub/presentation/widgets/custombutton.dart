
import 'package:flutter/material.dart';

Widget buttonItem(
    BuildContext context, {
    required String text,
    VoidCallback? onPressed, 
    bool loading=false
}) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Padding(
   
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.01, 
        ),
        child: SizedBox(
    
            width: screenWidth * 0.85, 
            height: screenHeight * 0.07, 
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0054A5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                child: loading ?
                CircularProgressIndicator()
                : Text(
                    text,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                    
                        fontSize: screenWidth * 0.045,
                        height: 1.0,
                        letterSpacing: 0,
                        color: const Color(0xffffffff),
                    ),
                ),
            ),
        ),
    );
}