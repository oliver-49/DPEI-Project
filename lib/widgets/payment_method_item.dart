// FILE: lib/widgets/payment_method_item.dart
// Reusable payment method item widget with radio button

import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? const Color(0xFF0062DC) : Colors.grey,
              width: 2,
            ),
          ),
          child: isSelected
              ? Container(
                  margin: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF0062DC), // Blue dot when selected
                  ),
                )
              : null,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}