import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isLogout;

  const MenuItemWidget({
    super.key,
    required this.title,
    required this.icon,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isLogout ? const Color(0xFFFFE5E5) : const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: isLogout ? const Color(0xFFFF5757) : const Color(0xFF666666),
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isLogout ? const Color(0xFFFF5757) : Colors.black,
            ),
          ),
          const Spacer(),
          if (!isLogout)
            const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF999999)),
        ],
      ),
    );
  }
}