import 'package:flutter/material.dart';

// هذا الـ Widget لشريط العنوان في شاشة التعديل
// This widget for app bar in edit profile screen
class EditProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed; // دالة الرجوع للخلف - Back button function
  
  const EditProfileAppBar({
    super.key,
    required this.onBackPressed,
  });

  @override
  // تحديد ارتفاع ثابت للـ AppBar - Set fixed height for AppBar
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // خلفية بيضاء - White background
      elevation: 0, // إزالة الظل - Remove shadow
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF0054A5)), // ← غيرت اللون هنا
        onPressed: onBackPressed, // عند الضغط تنفيذ دالة الرجوع - Execute back function when pressed
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start, // محاذاة لليسار - Left alignment
        children: [
          const Text(
            'Edit Profile', // عنوان الشاشة - Screen title
            style: TextStyle(
              color: Color(0xFF0054A5), // ← غيرت اللون هنا
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: false, // إلغاء التوسيط - Remove center alignment
    );
  }
}