import 'package:flutter/material.dart';

// هذا الـ Widget لزر الحفظ في شاشة التعديل - This widget for save button in edit profile screen
class SaveButton extends StatelessWidget {
  final VoidCallback onPressed; // دالة التنفيذ عند الضغط - Function to execute when pressed
  
  const SaveButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // عند الضغط تنفيذ الدالة - Execute function when tapped
      child: Container(
        width: double.infinity, // عرض كامل - Full width
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF0054A5), // ← غيرت اللون هنا
          borderRadius: BorderRadius.circular(12), // زوايا دائرية - Rounded corners
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0054A5).withOpacity(0.3), // ← غيرت اللون هنا
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Save', // نص الزر - Button text
            style: TextStyle(
              color: Colors.white, // لون أبيض - White color
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}