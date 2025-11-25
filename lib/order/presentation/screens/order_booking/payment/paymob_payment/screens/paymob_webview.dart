// paymob webview
import 'dart:convert';

import 'package:fixit/order/presentation/screens/order_booking/order/order_view.dart';
import 'package:fixit/order/presentation/screens/order_booking/payment/paymob_payment/screens/order_success_page.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;


class PaymentWebViewScreen extends StatefulWidget {
  final String paymentUrl;
 

  const PaymentWebViewScreen({super.key, required this.paymentUrl});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _webViewController;

  @override

  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(


//           onPageFinished: (String url) {
//             if (url.contains("txn_response_code=APPROVED")) {
//               Get.snackbar("نجاح", "✅ الدفع تم بنجاح",
//                   snackPosition: SnackPosition.BOTTOM);
//                   print("نجاح"+ "✅ الدفع تم بنجاح");

// //                    Future.delayed(const Duration(seconds: 5), () {
// //   Get.offNamed(RouteHelper.getHome());
// // });


//             } else if (url.contains("txn_response_code=")) {
//               Get.snackbar("فشل", "❌ فشل في الدفع",
//                   snackPosition: SnackPosition.BOTTOM);
//                   print("فشل"+"❌ فشل في الدفع");

// //               Future.delayed(const Duration(seconds: 5), () {
// //   Get.offNamed(RouteHelper.getHome());
// // });

//             }


//           },


onPageFinished: (String url) async {
  print("✅ Finished loading URL: $url");

  if (url.contains("txn_response_code=")) {
    String status = url.contains("txn_response_code=APPROVED") ? "APPROVED" : "FAILED";
    // String? orderId = widget.orderId;
    //  String? paymentId = Uri.parse(url).queryParameters["id"];

    // ✅ استدعاء API Laravel لتحديث حالة الدفع
   // if (orderId != null) {
  //     try {
  //       var response = await http.post(
  //         Uri.parse("${AppConstants.BASE_URL}${AppConstants.PAYMENT_URI}"),//http://10.0.2.2:8000/api/payment/status"),
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode({
  //           "txn_response_code": status,
  //           "order_id": orderId,
  //           "transaction_reference": paymentId,
  //         }),
  //       );

  //       print("✅ Payment status sent to server: ${response.body}");
  //     } catch (e) {
  //       print("❌ Failed to send payment status: $e");
  //     }
  // //  }

    if (status == "APPROVED") {
      Get.snackbar("نجاح", "✅ الدفع تم بنجاح", snackPosition: SnackPosition.TOP);
      Get.to(OrderSuccessPage(status: 1,));
    } else {
      Get.snackbar("فشل", "❌ فشل في الدفع", snackPosition: SnackPosition.TOP);
      Get.to(OrderSuccessPage(status: 0,));
    }
  }
},



        ),
      );
    _webViewController.loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return 
   
         Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title:  
            // controller.currentLang == 'ar' ? 
            Text("  صفحة الدفع ") ,
            // :   Text("Paymob "),
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.mainColor,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Get.to( OrdersView(
        // provider: widget.provider
      )) 
                // Get.to(
                  // RouteHelper.getInitial()
                  // ),
              ),
            ],
          ),
          body: WebViewWidget(controller: _webViewController),
        );
     ;
  }
}
