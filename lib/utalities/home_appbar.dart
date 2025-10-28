import 'package:dpei_project/utalities/Dimensions.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/Frame (2).png",height:Dimensions(context).height10*4,fit: BoxFit.cover ,),
            Icon(Icons.phone,size: 28,color: Colors.black,)
          ],);
  }
}