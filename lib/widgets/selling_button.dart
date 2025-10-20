import 'package:flutter/material.dart';

class SellingModeButton extends StatelessWidget {
  const SellingModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        children: [
          // ⭐⭐ الأيقونة من الـ assets ⭐⭐
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              'assets/icons/change_icon.png', // ← غير الاسم ده لاسم الملف اللي حملته من Figma
              width: 24,
              height: 24,
            ),
          ),
          // النص
          Text(
            'Change Profile to selling mode',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}