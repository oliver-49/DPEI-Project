import 'package:fixit/ye/utalities/Dimensions.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/ye/utalities/divider_title.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  final String ftext;
  final String ltext;
  final VoidCallback ontap;
  final List<Map<String, List<Map<String, dynamic>>>> Data;
  bool  more ;
      ServicesCard({super.key, 
              this.ftext='',  this.ltext='', 
              required this.Data, required this.ontap,this.more=true});

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: 
            List.generate(Data.length,(i){ 
              String title=Data[i].keys.first;
              List<Map<String, dynamic>> value=Data[i].values.first;
                return 
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
                children: [
                DividerTitle(ftext: title,ltext:"View all", ontap:ontap ,more:more),
                
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children:   List.generate(value.length,(index){ 
                      return  Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                        height: Dimensions(context).height10*10,
                        width: Dimensions(context).height10*10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyColor,
                              spreadRadius: 1
                            )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(value[index]['img']!,
                              fit: BoxFit.cover,
                              height: Dimensions(context).height10*6,
                              ),
                              Text(
                                (value[index]['job']!).length>9?
                                  (value[index]['job']!).substring(0,9)+'..'
                                  :  (value[index]['job']!),
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14, overflow:TextOverflow.ellipsis, 
                              ),
                              )
                          
                          ],),
                        ),
                                  
                                  ),
                      );
                        }))
                    ,
                  )
                
              ,
                ],
              ),
        );})
      
    );
  }
}