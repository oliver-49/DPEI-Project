// service_offer_responsive.dart
import 'package:dpei_project/presentation/screens/service_screens/workhour.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class ServiceOffer extends StatelessWidget {
  const ServiceOffer({super.key});

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
              'assets/images/aboutoffer.png',
              width: screenWidth * 3,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: screenWidth * 0.06,
          left: screenWidth * 0.06,
          top: screenHeight * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Service offer",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: const Color(0xff565656),
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            buildDropdownField(
              'Select Your service',
              screenWidth,
              screenHeight,
            ),
            SizedBox(height: screenHeight * 0.02),
            buildDropdownField(
              'Select Your Experience',
              screenWidth,
              screenHeight,
            ),
            SizedBox(height: screenHeight * 0.02),
            buildDropdownField(
              'Select Service Area',
              screenWidth,
              screenHeight,
            ),
            SizedBox(height: screenHeight * 0.17),

            buttonItem(
              context,
              text: "Next",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Workhour()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownField(
    String hintText,
    double screenWidth,
    double screenHeight,
  ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0054A5)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xffCACACA), width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.085,
          vertical: screenHeight * 0.037,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: screenWidth * 0.035,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: Color(0xff5C5F62),
        ),
      ),
      items: const [
        DropdownMenuItem(value: '1', child: Text('Option 1')),
        DropdownMenuItem(value: '2', child: Text('Option 2')),
      ],
      onChanged: (String? value) {
        // Add logic to handle selected value
      },
    );
  }
}
