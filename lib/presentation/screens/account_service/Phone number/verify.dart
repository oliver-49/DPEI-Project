import 'package:dpei_project/presentation/screens/account_service/locationui/location_acssess.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.01,
            ),
            child: Image.asset(
              'assets/images/verifyfram.png',
              width: screenWidth * 3,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
  
            padding: EdgeInsets.only(
              top: screenHeight * 0.04,
              left: screenWidth * 0.06,
              right: screenWidth * 0.06,
              bottom: screenHeight * 0.06,
            ),
            child: Text(
              "Enter 5-digit PIN code sent to your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff565656),
                fontSize: screenWidth * 0.045, 
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.07,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  5,
                  (index) => verfiyContainer(
                    context,
                    width: screenWidth * 0.14,
                    height: screenHeight * 0.06,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.07),
          buttonItem(context, text: 'Verify', onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LocationAcssess()),
            );
          }),
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/60.png',
                  width: screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.03),
                Text(
                  "Did not received code? ",
                  style: TextStyle(
                    color: const Color(0xff565656),
                    fontSize: screenWidth * 0.035,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "send again",
                  style: TextStyle(
                    color: const Color(0xff0054A5),
                    fontSize: screenWidth * 0.035,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget verfiyContainer(BuildContext context, {required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xff0054A5), width: 1),
      ),
    );
  }
}