import 'package:fixit/ye/utalities/Dimensions.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/ye/utalities/divider_title.dart';
import 'package:flutter/material.dart';

class ProvidersCard extends StatelessWidget {
  final String ftext;
  final VoidCallback ontap;
  final VoidCallback ontapView;
  final String ltext;
  final bool more;
  final bool  ViewAll;
  final List<Map<String, List<Map<String, String>>>> Data;
  const ProvidersCard({super.key, 
                this.ftext='', this.ltext='View all', 
                required this.Data, required this.ontapView,required this.ontap, this.more=true,
                this.ViewAll=false
                });

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: 
        List.generate(Data.length, (i){
          String title=Data[i].keys.first;
          List<Map<String, String>> list=Data[i].values.first;
          return 
        Column(
              children: [
               if (!ViewAll)
              DividerTitle(ftext:title ,ltext:ltext ,more: more,ontap: ontap,),
              ...List.generate(
                ViewAll?
                (list.length/2).toInt():1,(i)=> SizedBox(
                  
                  height: Dimensions(context).height10*27,
                  width: double.infinity,
                child: 
                  InkWell(
                    onTap: ontapView,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                    
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                        // height: Dimensions(context).height10*10,
                        // width: Dimensions(context).height10*10,
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
                          padding: const EdgeInsets.all(15),
                          child: Center(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(list[(i+1)*2-2]['img']!,
                                  // width: double.infinity,
                                  height: Dimensions(context).height10*12,
                          
                                  fit: BoxFit.cover,
                                  
                                  
                                  ),
                                ),
                                SizedBox(height: Dimensions(context).height10,),
                                Text(list[(i+1)*2-2]['name']!,
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Text(list[(i+1)*2-2]['job']!,
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16
                                ),
                                ),
                                Expanded(child: SizedBox()),
                                Row(children: [
                                  Icon(Icons.star,color: AppColors.mainColor,size: 20,),
                                  SizedBox(width: Dimensions(context).height10/2,),
                                  Text(list[(i+1)*2-2]['rate']!,style: TextStyle(
                                    color: AppColors.mainColor,fontSize: 16
                                  ),),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.symmetric(
                          
                                        horizontal: 10,vertical: 5
                                      ),
                                      child: Text("Details",style: TextStyle(
                                      color: Colors.white
                                      ,fontSize: 16
                                                                ),),
                                    ),),
                                  )
                                ],)
                            
                            ],),
                          ),
                        ),
                                  
                                  ),
                                   ),
                     ) ,
                      Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                        // height: Dimensions(context).height10*10,
                        // width: Dimensions(context).height10*10,
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
                          padding: const EdgeInsets.all(15),
                          child: Center(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(list[(i+1)*2-1]['img']!,
                                  // width: double.infinity,
                                  height: Dimensions(context).height10*12,
                          
                                  fit: BoxFit.cover,
                                  
                                  
                                  ),
                                ),
                                SizedBox(height: Dimensions(context).height10,),
                                Text(list[(i+1)*2-1]['name']!,
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Text(list[(i+1)*2-1]['job']!,
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16
                                ),
                                ),
                                Expanded(child: SizedBox()),
                                Row(children: [
                                  Icon(Icons.star,color: AppColors.mainColor,size: 20,),
                                  SizedBox(width: Dimensions(context).height10/2,),
                                  Text(list[(i+1)*2-1]['rate']!,style: TextStyle(
                                    color: AppColors.mainColor,fontSize: 16
                                  ),),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(child: Padding(
                                      padding: const EdgeInsets.symmetric(
                          
                                        horizontal: 10,vertical: 5
                                      ),
                                      child: Text("Details",style: TextStyle(
                                      color: Colors.white
                                      ,fontSize: 16
                                                                ),),
                                    ),),
                                  )
                                ],)
                            
                            ],),
                          ),
                        ),
                                  
                                  ),
                                   ),
                     ) ,
                                    ]),
                  )
                ,
                ),
              ),
            
            
              ],
            )
            ;})
      
    );
  }
}