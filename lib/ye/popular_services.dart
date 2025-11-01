import 'package:fixit/ye/utalities/Dimensions.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/ye/utalities/custom_appbar.dart';
import 'package:fixit/ye/utalities/Services/services_card.dart';
import 'package:flutter/material.dart';

class PopularServices extends StatelessWidget {
    PopularServices({super.key});

    List<Map<String, List<Map<String, String>>>> servicesCard=[
      
        {
          "Maintenance":
           [{
          "img": "assets/images/Air Conditenior.png",
          "job":"Air Condition",
          
        },
        {
          "img": "assets/images/Multimeter.png",
          "job":"Electric",
        },
        {
          "img": "assets/images/image 100.png",
          "job":"Siding repair",
        },
        {
          "img": "assets/images/Car Wash.png",
          "job":"Car Wash",
        },]
          
        },
        {
          "Cleaning":
          [{
          "img": "assets/images/Spin Mop.png",
          "job":"Home Flooring",
          
        },
        {
          "img": "assets/images/image 101.png",
          "job":"Gutter",
        },
        {
          "img": "assets/images/Frame 1000003290.png",
          "job":"Carpet",
        },
        {
          "img": "assets/images/Pliers.png",
          "job":"Pliers",
        },]
          
        },
        {
          "Home improvement":
           [{
          "img": "assets/images/image 109.png",
          "job":"Drilling",
          
        },
        {
          "img": "assets/images/image 102.png",
          "job":"lawn ",
        },
        {
          "img": "assets/images/image 103.png",
          "job":"Weed control",
        },
        {
          "img": "assets/images/Water Tap.png",
          "job":"Water Tap",
        },]
          
        },
        {
          "Security":
           [{
          "img": "assets/images/CCTV (1).png",
          "job":"Cameras",
          
        },
        {
          "img": "assets/images/image 104 (1).png",
          "job":"Burglar alarm",
        },
        {
          "img": "assets/images/image 105 (1).png",
          "job":"Sturdy lock",
        },
        {
          "img": "assets/images/Cctv (2).png",
          "job":"Cctv",
        },]
          
        },
        {
          "Car Maintenance":
           [{
          "img": "assets/images/Car Waxing.png",
          "job":"Car washer",
          
        },
        {
          "img": "assets/images/image 109 (1).png",
          "job":"Oil change",
        },
        {
          "img": "assets/images/image 110.png",
          "job":"Car battery",
        },
        {
          "img": "assets/images/Car Wash.png",
          "job":"Car Waxing",
        },]
          
        },
        {
          "Handyman Services":
          [{
          "img": "assets/images/image 108 (1).png",
          "job":"Furniture",
          
        },
        {
          "img": "assets/images/image 111.png",
          "job":"Door",
        },
        {
          "img": "assets/images/image 112.png",
          "job":"Shelving ",
        },
        {
          "img": "assets/images/Painter holding paint roller and paint bucket.png",
          "job":"Painting",
        },]
          
        },
         {
          "Other services":
          [{
          "img": "assets/images/image 113.png",
          "job":"Interior",
          
        },
        {
          "img": "assets/images/image 114.png",
          "job":"Exterior",
        },
        {
          "img": "assets/images/image 115.png",
          "job":"Wall ",
        },
        {
          "img": "assets/images/image 116.png",
          "job":"Dish wash  ",
        },
        {
          "img": "assets/images/image 117 (1).png",
          "job":"Loading",
        },
        {
          "img": "assets/images/image 118.png",
          "job":"Cutting",
        },
        {
          "img": "assets/images/Boy mopping the floor.png",
          "job":"Mopping Floor",
        },
        ]
          
        },
      
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body:  Padding(
        padding:  EdgeInsets.only(
          // top: Dimensions(context).height10*5,
          left: Dimensions(context).height10,
          right: Dimensions(context).height10,
          bottom: Dimensions(context).height10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
                CustomAppBar(title:"Popular services"),
                ServicesCard(
                  Data: servicesCard, more:false,
                  ontap: () {  },)
          
            ],
          ),
        ),
      ),
    );
  }
}