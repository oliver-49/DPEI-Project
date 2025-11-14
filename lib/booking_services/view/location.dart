
import 'package:fixit/booking_services/view/address.dart';
import 'package:fixit/booking_services/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

<<<<<<< Updated upstream:lib/booking_services/view/location.dart
=======
import '../../../l10n/app_localizations.dart';
import '../../../ye/utalities/colors.dart';
>>>>>>> Stashed changes:lib/gitHub/booking_services/view/location.dart
import 'const.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
<<<<<<< Updated upstream:lib/booking_services/view/location.dart
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight*.040,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back,color: Color(0xff2B54A4),)),
                      SizedBox(width: screenWidth*.020,),
                  Text("حجز سباك",style: TextStyle(color: Color(0xff2B54A4),fontSize: 25,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: screenHeight*.056,),
=======
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight*.040,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back,color: Color(0xff2B54A4),)),
                    SizedBox(width: screenWidth*.020,),
                Text(lang.bookPlumber,style: TextStyle(color: Color(0xff2B54A4),fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: screenHeight*.056,),
>>>>>>> Stashed changes:lib/gitHub/booking_services/view/location.dart

                Text(
                  lang.allowForFixit,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * .012),
                Text(
                  lang.weAreNeedToKnowYourLocation,
                ),
                SizedBox(height: screenHeight * .030),
                Image.asset(imagepath + "map.png"),
                SizedBox(height: screenHeight * .080),
                Column(children: [
                  Text(
<<<<<<< Updated upstream:lib/booking_services/view/location.dart
                    "السماح لـ Fixlt باستخدام موقعك",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * .012),
                  Text(
                    "نحن بحاجة إلى معرفة موقعك الدقيق حتى يتمكن الكهربائي من زيارتك بسهولة.",
                  ),
                  SizedBox(height: screenHeight * .030),
                  Image.asset(imagepath + "map.png"),
                  SizedBox(height: screenHeight * .080),
                  Column(children: [
                    Text(
                    "السماح مرة واحدة",
                    style: TextStyle(color: Color(0xff0054A5), fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * .007),
                  Divider(),
                  SizedBox(height: screenHeight * .007),
                   Text(
                    "السماح أثناء استخدام FixIt",
                    style: TextStyle(color: Color(0xff0054A5), fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * .007),
                  Divider(),
                  SizedBox(height: screenHeight * .007),
                   Text(
                    "لا تسمح",
                    style: TextStyle(color: Color(0xff0054A5), fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  ],),
                  SizedBox(height: screenHeight*.09,),
                  customButton(title: "املأ يدويًا", onTap: (){
                    Get.to(Address());
                  })
=======
                  lang.allowOnce,
                  style: TextStyle(color: Color(0xff0054A5), fontSize: 16,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * .007),
                Divider(),
                SizedBox(height: screenHeight * .007),
                 Text(
                  lang.allowDuringUsingFixit,
                  style: TextStyle(color: Color(0xff0054A5), fontSize: 16,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * .007),
                Divider(),
                SizedBox(height: screenHeight * .007),
                 Text(
                  lang.dontAllow,
                  style: TextStyle(color: Color(0xff0054A5), fontSize: 16,fontWeight: FontWeight.bold),
                ),
                ],),
                SizedBox(height: screenHeight*.09,),
                customButton(title: lang.fillManually, onTap: (){
                   Get.to(
    BlocProvider.value(
      value: context.read<BookingCubit>(),
      child: Address(),
    ),
        );
                })
>>>>>>> Stashed changes:lib/gitHub/booking_services/view/location.dart

              ],
            ),
          ),
        ),
      ),
    );
  }
}
