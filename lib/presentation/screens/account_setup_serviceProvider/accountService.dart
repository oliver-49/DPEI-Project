import 'package:flutter/material.dart';


class AccountSetup  extends StatelessWidget {
  const AccountSetup ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Color(0xffFFFFFF),
       appBar: AppBar(
        
  backgroundColor: Colors.white,
  title: InkWell(
  onTap: () {
    Navigator.pop(context);
  },
    child: Padding(
      padding: const EdgeInsets.only(left: 2,right: 24),
      child: Image.asset(
        'assets/images/fram.png',
      ),
    ),
  ),
),
       body: Padding(
         padding: const EdgeInsets.only(left:24,),
         child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 36,right: 216,),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Text("I am", style: TextStyle(color:Color(0xff565656),
                  fontSize: 48,
                  fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,),),
                ],
              ),
            )
      , 
      SizedBox(height: 30,),
        Container(
        width: 327,
        height: 152,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Color(0x260773DA), 
              width: 1,
            ),
          ),
        child: Padding(
          padding: const EdgeInsets.only(left: 32,right: 98,top: 46.5,bottom: 96.5),
          child: Text("Service Provider",style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              height: 1.0,
              letterSpacing: 0,
              color: Color(0xff565656)
          ),),
        ),
              )
          ],
         ),
       ),

      );
  }
}