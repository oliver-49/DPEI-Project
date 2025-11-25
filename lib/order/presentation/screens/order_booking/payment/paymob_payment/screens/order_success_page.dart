
import 'package:fixit/order/presentation/screens/order_booking/order/order_view.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderSuccessPage extends StatelessWidget {
  // final String orderID;
  final int status;
  const OrderSuccessPage(
      {super.key, 
      // required this.orderID
       required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      Future.delayed(Duration(seconds: 1), () {
        //    Get.dialog(PaymentFailedDialog(orderId:orderID),barrierDismissible: false);
      });
    }
    return 
    
        Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding:  EdgeInsets.only(
              top: 40*4,
              left: 10,
              right: 10,
              
            ),
            child: Center(
              child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, 
                      children: [
                      // Icon( status == 1
                      //     ? Icons.check_circle_outline
                      //     : Icons.cancel_outlined,
                      //     size: 100,color: status == 1 ? Colors.green : Colors.red,),
                    Image.asset(
                      status == 1
                          ? "assets/images/success.png"//warning
                          : "assets/images/warning.png",//success
                      width:100,height: 100,
                    ),
                    SizedBox(
                      height: 20*2.25,
                    ),
                     Text(
      status==1? "You placed the order successfully":"your order has been canceled",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize:25,
      )
    ),
                    
                   
                    Padding(padding: EdgeInsets.only(
                    bottom: 20,
                    left: 20/1.1,),
                    child:
                    status==1? 
                        
            Text(
            'successfully',    style: TextStyle(fontSize:20,
                      color: status==1?Colors.green:Colors.grey[500]),
                      textAlign: TextAlign.center,
          )

         :
        
            Text(
            'failed',    style: TextStyle(fontSize:20,
                      color: status==1?Colors.green:Colors.grey[500]),
                      textAlign: TextAlign.center,
          ),

        
                    
                      ),
            
                      Padding(padding: EdgeInsets.all(20),
                      child: 
                      CustomButton(
                        
                        bkcolor: status==1?Colors.green:Colors.redAccent,
                        buttonText: 
                        //  controller.currentLang == 'ar' ? 
                        "  ارجع الى الصفحة الرئيسية  " 
                        // : "Back to Home"
                        ,fontSize: 20/1.1,
                        onPressed: 
                      ()=>Get.to( OrdersView(
        // provider: widget.provider
      ))
                      // Get.offAllNamed(



                      //   RouteHelper.getInitial()



                      //   ),
                      ),
                      )
                   
                
                  ])),
            ),
          ),
        );
  }

}


class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final double? iconSize;
  final IconData? icon;
  final Color bkcolor;
  final Color textColor;
  CustomButton({super.key,
      required this.buttonText, 
      this.onPressed, 
      this.transparent=false,
      this.margin,
      this.height,
      this.width, 
      this.fontSize,
      this.radius=5, 
      this.iconSize,
      this.icon, 
      this.bkcolor= const Color.fromARGB(193, 145, 34, 34),
      this.textColor=Colors.white,
      });

  @override
  Widget build(BuildContext context) {
     final ButtonStyle _flatButton= TextButton.styleFrom(
      backgroundColor: onPressed==null?Theme.of(context).disabledColor:transparent?Colors.transparent:bkcolor,
      minimumSize: Size(width==null?10*13:width!, height==null?10*5:height!),      
      padding: EdgeInsets.zero,
      side: BorderSide(
        color: Colors.black,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),

    );
    return Center(child: 
    SizedBox(
      width: width ?? double.maxFinite,
      height: height ?? 50,
      child: TextButton(
        onPressed: onPressed,
        style: _flatButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon==null?SizedBox():Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(icon,color: transparent?AppColors.mainColor:Colors.black38,)//size: iconSize,),
            ),
            Text(buttonText,style: TextStyle(
              fontSize: fontSize??16,
              color: onPressed!=null?textColor:Colors.black38,
            ),),
          ],)
    ),
    )
    );
  }
}