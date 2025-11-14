
import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/booking_services/view/address.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../l10n/app_localizations.dart';
import '../../../ye/utalities/colors.dart';
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
