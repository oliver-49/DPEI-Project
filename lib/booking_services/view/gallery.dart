import 'package:fixit/booking_services/view/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../l10n/app_localizations.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
<<<<<<< Updated upstream:lib/booking_services/view/gallery.dart
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        SizedBox(height: screenHeight * .040),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back, color: Color(0xff2B54A4)),
                        ),
                        SizedBox(width: screenWidth * .020),
                        const Text(
                          "المعرض",
                          style: TextStyle(
                            color: Color(0xff2B54A4),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
=======
    return Scaffold(
    backgroundColor: AppColors.bgColor,
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: screenHeight * .040),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back, color: Color(0xff2B54A4)),
>>>>>>> Stashed changes:lib/gitHub/booking_services/view/gallery.dart
                    ),
                    SizedBox(width: screenWidth * .020),
                     Text(
                      lang.gallary,
                      style: TextStyle(
                        color: Color(0xff2B54A4),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                      SizedBox(height: screenHeight * .040),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.all(10),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: craftsMansImages.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Image.asset(
                                imagepath+craftsMansImages[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ]))));
  }
}
