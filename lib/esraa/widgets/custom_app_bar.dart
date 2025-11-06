import 'package:flutter/material.dart';

// Custom app bar widget for consistent header across screens
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false, // Title aligned to the left near back button
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF007AFF), // Blue color for title
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF007AFF)), // Blue color for back arrow
              onPressed: () => Navigator.pop(context),
            )
          : null,
    );
  }
}