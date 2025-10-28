import 'package:dpei_project/utalities/Dimensions.dart';
import 'package:dpei_project/utalities/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
    CustomAppBar({super.key,  required  this.title});

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding:  EdgeInsets.only(
          top: Dimensions(context).height10*5.3,
          // left: Dimensions(context).height10,
          // right: Dimensions(context).height10,
          bottom: Dimensions(context).height10,
        ),
      child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back,size: 29,color: AppColors.mainColor,)),
                SizedBox(width: Dimensions(context).height10*1.5,),
                Text(title,style: TextStyle(
                  color: AppColors.mainColor,fontSize: 19,fontWeight: FontWeight.bold
                ),)
            ],),
    );
  }
}