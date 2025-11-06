
import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/booking_services/view/address.dart';
import 'package:fixit/gitHub/booking_services/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                  Text("حجز سباك",style: TextStyle(color: Color(0xff2B54A4),fontSize: 25,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: screenHeight*.056,),

                  Text(
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
      ),
    );
  }
}
