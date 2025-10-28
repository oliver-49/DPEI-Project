import 'package:dpei_project/utalities/Dimensions.dart';
import 'package:dpei_project/utalities/colors.dart';
import 'package:dpei_project/utalities/custom_appbar.dart';
import 'package:dpei_project/utalities/providers_card.dart';
import 'package:flutter/material.dart';

class ProvidersServices extends StatelessWidget {
   ProvidersServices({super.key});


    List<Map<String, List<Map<String, String>>>> personalCards=[
      
        {
          "Electrician Providers":
          [
            {
          "img": "assets/images/Frame 1000003323 (1).png",
          "name":'Jackson ',
          "job":"Electrician",
          "rate":"4.8"
        },
          {
          "img": "assets/images/Frame 1000003323 (2).png",
          "name":'Emily jani',
          "job":"Electrician",
          "rate":"4.8"
        }
        ,  {
          "img": "assets/images/Frame 1000003323 (11).png",
          "name":'Jackson ',
          "job":"Electrician",
          "rate":"4.8"
        },
          {
          "img": "assets/images/Frame 1000003323 (12).png",
          "name":'Emily jani',
          "job":"Electrician",
          "rate":"4.8"
        }
        ,]
          
        },
         {
          "Plumber Providers":
          [
            {
          "img": "assets/images/Frame 1000003323 (3).png",
          "name":'Ethan lita ',
          "job":"Plumber",
          "rate":"4.8"
        },
          {
          "img": "assets/images/Frame 1000003323 (4).png",
          "name":'Isabella una',
          "job":"Plumber",
          "rate":"4.8"
        }
        ,]
          
        },
         {
          "Carpenter Providers":
          [
            {
          "img": "assets/images/Frame 1000003323 (5).png",
          "name":'Aiden  ',
          "job":"Carpenter",
          "rate":"4.8"
        },
          {
          "img": "assets/images/Frame 1000003323 (6).png",
          "name":'Logan ',
          "job":"Carpenter",
          "rate":"4.8"
        }
        ,]
          
        },
         {
          "Painter Providers":
          [
            {
          "img": "assets/images/Frame 1000003323 (7).png",
          "name":'Lucas ',
          "job":"Painter",
          "rate":"4.8"
        },
          {
          "img": "assets/images/Frame 1000003323 (8).png",
          "name":'Ethan',
          "job":"Painter",
          "rate":"4.8"
        }
        ,]
          
        },
         {
          "Cleaner Providers":
          [
            {
          "img": "assets/images/Frame 1000003323 (9).png",
          "name":'Harper ',
          "job":"Cleaner",
          "rate":"4.8"
        },
          {
          "img": "assets/images/Frame 1000003323 (10).png",
          "name":'Caleb',
          "job":"Cleaner",
          "rate":"4.8"
        }
        ,]
          
        },
         {
          "Locksmith Providers":
          [
            {
          "img": "assets/images/Frame 1000003323 (11).png",
          "name":'Benjamin ',
          "job":"Locksmith",
          "rate":"4.8"
        },
          {
          "img": "assets/images/Frame 1000003323 (12).png",
          "name":'Carter',
          "job":"Locksmith",
          "rate":"4.8"
        }
        ,]
          
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
          child: Column(children: [
            CustomAppBar(title: "Services Providers"),
            ProvidersCard(Data: personalCards, ontap: () {  },),
            SizedBox(height: Dimensions(context).height10,)
          
          
          ],),
        ),
      ),
    );
  }
}