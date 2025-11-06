// FILE: lib/widgets/custom_switch.dart
// Custom switch widget with blue color when active

import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFF0054A5), 
      activeTrackColor: const Color(0xFF0054A5).withOpacity(0.5), 
    );
  }
}