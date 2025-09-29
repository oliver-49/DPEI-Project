// workhour_responsive.dart
import 'package:dpei_project/presentation/screens/account_service/Upload%20documents/upload_documents.dart';
import 'package:dpei_project/presentation/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class Workhour extends StatelessWidget {
  const Workhour({super.key});

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
          bottom: screenHeight * 0.2, 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Service working hours",
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: const Color(0xff565656),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            buildTimeField('From', screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.02),
            buildTimeField('To', screenWidth, screenHeight),
        SizedBox(height: screenHeight * 0.15),
            buttonItem(context, text: "Next", onPressed: () {
           
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  UploadDocuments()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildTimeField(String label, double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: screenHeight * 0.005),
        SizedBox(
          width: screenWidth * 0.85,
          height: screenHeight * 0.07,
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0054A5)),
              ),
              hintText: 'HH:MM',
              hintStyle: TextStyle(
                fontSize: screenWidth * 0.035,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: const BorderSide(color: Color(0xffCACACA)),
              ),
            ),
            keyboardType: TextInputType.datetime,
          ),
        ),
      ],
    );
  }
}