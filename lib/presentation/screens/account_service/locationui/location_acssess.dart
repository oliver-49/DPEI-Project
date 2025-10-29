// location_acssess_responsive.dart
import 'package:dpei_project/presentation/screens/account_service/locationui/setlocation.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class LocationAcssess extends StatelessWidget {
  const LocationAcssess({super.key});

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
              'assets/images/locationfram.png',
              width: screenWidth * 3,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.04,
          left: screenWidth * 0.06,
          right: screenWidth * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Allow “FixIt” to use your location",
              style: TextStyle(
                color: const Color(0xff565656),
                fontSize: screenWidth * 0.045,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "We need to know your exact location so that Clients can find you easily near you.",
              style: TextStyle(
                color: const Color(0xff565656),
                fontSize: screenWidth * 0.035,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Image.asset(
                'assets/images/image 49.png',
                width: screenWidth * 0.8,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: Text(
                "Allow Once",
                style: TextStyle(
                  color: const Color(0xff0054A5),
                  fontSize: screenWidth * 0.04,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Text(
                "Allow While Using FixIt",
                style: TextStyle(
                  color: const Color(0xff0054A5),
                  fontSize: screenWidth * 0.04,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Text(
                "Don’t Allow",
                style: TextStyle(
                  color: const Color(0xff0054A5),
                  fontSize: screenWidth * 0.04,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            buttonItem(context, text: 'Continue', onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Setlocation()),
              );
            }),
          ],
        ),
      ),
    );
  }
}