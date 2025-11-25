import 'package:fixit/order/presentation/homescreen.dart';
import 'package:fixit/order/presentation/screens/order_booking/order/order_view.dart';
import 'package:fixit/order/presentation/screens/order_booking/payment/give_feedback_view.dart';
import 'package:flutter/material.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:get/get.dart';

class PaymentSuccessDialog {
  static void show(BuildContext context, {required double amount}) {
    final t = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 70,
                  color: Color(0xff0054A5),
                ),

                const SizedBox(height: 15),

                Text(
                  t.paymentSuccessful,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Color(0xff3A3A3A),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "${t.paymentOf} \$${amount.toStringAsFixed(2)} ${t.paidSuccessfully}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff565656),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0054A5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                   Navigator.pop(context);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => OrdersView(
        // provider: widget.provider
      )),
                      );
                    },
                    child: Text(
                      t.home,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const GiveFeedbackView(),
                      ),
                    );
                  },
                  child: Text(
                    t.giveFeedback,
                    style: const TextStyle(
                      color: Color(0xff0054A5),
                      decoration: TextDecoration.underline,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
