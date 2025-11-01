import 'package:dpei_project/utalities/Dimensions.dart';
import 'package:dpei_project/utalities/colors.dart';
import 'package:flutter/material.dart';

class DividerTitle extends StatelessWidget {
  final String ftext;
  final String ltext;
  final VoidCallback ontap;
  final bool  more;
  
  DividerTitle({super.key,required this.ftext,required this.ltext, required this.ontap,this.more=true});

  @override
  Widget build(BuildContext context) {
    return   Padding(
              padding: EdgeInsets.symmetric(vertical:Dimensions(context).height10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text(ftext,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: AppColors.textColor
                ),),
                if(more)
                InkWell(
                  onTap: ontap,
                  child: Text(ltext,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: AppColors.mainColor
                  ),),
                ),
              ],),
            );
  }
}