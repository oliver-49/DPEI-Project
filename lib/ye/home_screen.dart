import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/booking_services/view/providerprofile.dart';
import 'package:fixit/ye/popular_services.dart';
import 'package:fixit/ye/providers_services.dart';
import 'package:fixit/ye/utalities/home_appbar.dart';
import 'package:fixit/ye/utalities/Dimensions.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/ye/utalities/custom_appbar.dart';
import 'package:fixit/ye/utalities/divider_title.dart';
import 'package:fixit/ye/utalities/providers_card.dart';
import 'package:fixit/ye/utalities/Services/services_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});
      List<Map<String, List<Map<String, dynamic>>>> servicesCard=[
      
        {
          "Popular Services":
           [
           {
          "img": "assets/images/Plumber.png",
          "job":"Plumbing",
          
        },
        {
          "img": "assets/images/Multimeter.png",
          "job":"Electric work",
        },
        {
          "img": "assets/images/Solar Energy.png",
          "job":"Solar",
        },
        {
          "img": "assets/images/Air Conditenior.png",
          "job":"Air Condition",
        }
        ,]
          
        },];

      List<Map<String, List<Map<String, String>>>> personalCard=[
      
        {
          "Service Providers":
          [
            {
          "img": "assets/images/Frame 1000003323 (21).png",
          "name":'Maskot Kota',
          "job":"Plumber",
          "rate":"4.8"
        },
          {
          "img": "assets/images/Frame 1000003323 (22).png",
          "name":'Shams Jan',
          "job":"Electrician",
          "rate":"4.8"
        }
        ,]
          
        },
        
        ];


    
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions(context).height10*5,
        left: 25,
        right: 25,
        bottom: 10
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          HomeAppbar(),
          SizedBox(height: Dimensions(context).height10*2,),
          Container(
            height: Dimensions(context).height10*20,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      AppColors.gradient1Color,
                      AppColors.gradient2Color,
                      ])
                    ),
                  child: Padding(
                    padding:  EdgeInsets.all(Dimensions(context).height10*2),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Get 30% off",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: Dimensions(context).height10,),
                        Text("Just by Booking Home \nServices ",
                         style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold
                        ),),
         
                      ],
                    ),
                  ),)
                  
                  ),
                  Positioned(
                    right: Dimensions(context).height10*2,top: 0,
                    child: Container(
                      child: Image.asset("assets/images/image 87.png",height: Dimensions(context).height10*18,fit: BoxFit.cover,),)),
                  
                  Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: Dimensions(context).height10*6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                     BoxShadow(
                      color: AppColors.greyColor!,
                      // blurRadius: 1,
                      spreadRadius: 2
        
                    )],
                    ),
                  child:Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.search),SizedBox(width: 15,),
                        Text("Search Here.."),Expanded(child: SizedBox()),
                        Icon(Icons.tune)
                    ],),
                  ),
                  )
                  
                  )
                  
                  ,
        
              ],
            ),
          ),
          SizedBox(height: Dimensions(context).height10*2,),
          ServicesCard( Data: servicesCard, ontap: () { 
            // Navigator.push(context, MaterialPageRoute(builder: (contex)=>PopularServices()));
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PopularServices()),
            );
           },),
          SizedBox(height: Dimensions(context).height10*2,),
          ProvidersCard(Data: personalCard,
            ontap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProvidersServices()),);
              }, ontapView: () { 
                 Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => 
                BlocProvider(
        create: (context) => BookingCubit(),
      // servicesCard[0].values.first,),
      //   child: MyApp())
        
        
                  child:  ProviderProfile()
                )),
            ); },),
          SizedBox(height: Dimensions(context).height10*1.5,)
        
        
        
        
        ],),
      ),
    
    );
  }
}