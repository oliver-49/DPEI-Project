import 'package:flutter/material.dart';

class EditProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;  // Back button function
  
  const EditProfileAppBar({
    super.key,
    required this.onBackPressed,
  });

  @override
  // Set fixed height for AppBar
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, 
      elevation: 0, 
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF0054A5)), 
        onPressed: onBackPressed,  // Execute back function when pressed
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,  //Left alignment
        children: [
          const Text(
            'Edit Profile',  //  Screen title
            style: TextStyle(
              color: Color(0xFF0054A5), 
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: false,  //  Remove center alignment
    );
  }
}