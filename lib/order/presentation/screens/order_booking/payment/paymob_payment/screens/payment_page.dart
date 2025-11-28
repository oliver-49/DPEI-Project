

//payment page
import 'dart:async';
import 'package:fixit/order/presentation/screens/order_booking/payment/paymob_payment/screens/paymob_webview.dart';
import 'package:fixit/order/presentation/screens/order_booking/payment/paymob_payment/utalities/paymob_manager.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../../../l10n/app_localizations.dart';


class PaymentPage extends StatefulWidget {

  final double order_amount;
  
  PaymentPage({ required this.order_amount});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isLoading = true; // هنبدأ بتحميل تلقائي

  @override
  void initState() {
    super.initState();
    _startPayment();
  }

  Future<void> _startPayment() async {
    try {
      print("---------------------------- statrt loading page");
      String paymentKey = await PaymobManager()
          .getPaymentKey((widget.order_amount+6.0), "EGP");
      String url =
          "https://accept.paymob.com/api/acceptance/iframes/928968?payment_token=$paymentKey";

      setState(() {
        _isLoading = false;
      });

      Get.to(
          PaymentWebViewScreen(paymentUrl:url)
          
          );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      Get.snackbar(
        AppLocalizations.of(context)!.error,
        AppLocalizations.of(context)!.payment_failed_message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return
    
    
        Scaffold(
          appBar: AppBar(
            title: 
            // controller.currentLang == 'ar'
            //     ? 
            Text(AppLocalizations.of(context)!.payment_page_title)
                // : 
                // Text("Paymob ")
                ,
            backgroundColor: AppColors.mainColor,
            foregroundColor: Colors.white,
          ),
          body: Center(
            child: _isLoading
                ? CircularProgressIndicator(
                    color: AppColors.mainColor,
                  )
                : Text(
                    // controller.currentLang == 'ar'
                    //     ?
              AppLocalizations.of(context)!.payment_loading,
                        // :
                        //  "Redirecting to payment...",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        );
      
      
  }
}
