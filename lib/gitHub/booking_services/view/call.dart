import 'package:fixit/gitHub/booking_services/view/const.dart';
import 'package:fixit/gitHub/booking_services/view/providerprofile.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
        backgroundColor: AppColors.bgColor,
            body: SafeArea(
                child:SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * .2),
                        CircleAvatar(
                          radius: screenHeight * .070,
                          backgroundColor: Color(0xffEAEFF4),
                           child: Image.asset(imagepath+"craftsman.png"),
                        ),
                        SizedBox(height: screenHeight * .020),
                        Text(
                          "إميلي جاني",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: screenHeight * .010),
                        Text(" minutes 02:28 "),
                        SizedBox(height: screenHeight * .2),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: screenHeight * .030,
                                  backgroundColor: Color(0xffEAEFF4),
                                  child:Icon(CupertinoIcons.video_camera,color: Colors.grey[700],) ,
                                ),
                                Text("Video")
                              ],
                            ),
                            SizedBox(width: screenWidth * .060),

                            Column(
                              children: [
                                CircleAvatar(
                                  radius: screenHeight * .030,
                                  backgroundColor: Color(0xffEAEFF4),
                                  child:Icon(CupertinoIcons.speaker_2,color: Colors.grey[700],) ,
                                ),
                                Text("Speaker")
                              ],
                            ),
                            SizedBox(width: screenWidth * .060),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: screenHeight * .030,
                                  backgroundColor: Color(0xffEAEFF4),
                                  child:Icon(CupertinoIcons.volume_off,color: Colors.grey[700],) ,
                                ),
                                Text("Mute")
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: screenHeight * .030),
                        InkWell(
                          onTap: (){
                            Get.off(ProviderProfile());
                          },
                          child: CircleAvatar(
                            radius: screenHeight * .030,
                            backgroundColor: Color(0xffDC4437),
                            child:Icon(Icons.call,color: Colors.white,) ,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            )
        )
    );
  }
}
