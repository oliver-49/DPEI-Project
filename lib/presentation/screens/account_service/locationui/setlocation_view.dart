// setlocation_responsive.dart
import 'package:dpei_project/presentation/screens/service_screens/aboutoffer.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class Setlocation extends StatelessWidget {
  const Setlocation({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
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
            SizedBox(height: screenHeight * 0.01),
            Text(
              "We need to know your exact location so that Clients can find you easily near you.",
              style: TextStyle(
                color: const Color(0xff565656),
                fontSize: screenWidth * 0.035,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.25),
            Container(
              height: screenHeight * 0.1,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xffCACACA), width: 1),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.04),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                      size: screenWidth * 0.06,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Street no. 23 Ouch west road Alibagh, Alibagh, Ouch, 18750, Pakistan",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              height: screenHeight * 0.07,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xffCACACA), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                child: Text(
                  "Business name",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 42, 41, 41),
                    fontSize: screenWidth * 0.035,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              height: screenHeight * 0.07,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xffCACACA), width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                child: Text(
                  "Business Address",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 42, 41, 41),
                    fontSize: screenWidth * 0.035,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            buttonItem(
              context,
              text: "Next",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServiceOffer()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
