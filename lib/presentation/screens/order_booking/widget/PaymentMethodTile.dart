// ignore_for_file: file_names

import 'package:fixit/presentation/screens/order_booking/payment/select_payment/payment_method_model.dart';
import 'package:flutter/material.dart';

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethodModel method;
  final bool selected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.method,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: w * 0.04),
        padding: EdgeInsets.symmetric(vertical: w * 0.04, horizontal: w * 0.04),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? const Color(0xff0054A5) : const Color(0xffE0E0E0),
            width: selected ? 2 : 1,
          ),
          color: selected ? const Color(0xffE8F2FB) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(method.icon, width: 32, height: 32),
            SizedBox(width: w * 0.04),
            Expanded(
              child: Text(
                method.name,
                style: const TextStyle(
                  color: Color(0xff565656),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Icon(
              Icons.check_circle,
              color: selected ? const Color(0xff0054A5) : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
