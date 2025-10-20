// FILE: lib/widgets/setting_item.dart
// Reusable setting item widget for each notification option

import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Widget trailing;

  const SettingItem({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}