

// --- Reusable Widget: Custom Text Field (A slightly modified version for this screen) ---
import 'package:fixit/basma/screens/main_profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomProfessionField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Widget? suffixWidget;
  final bool readOnly;
  final double? widthFactor; // For use in split rows
  final int maxLines;

  const CustomProfessionField({
    Key? key,
    required this.label,
    required this.initialValue,
    this.suffixWidget,
    this.readOnly = true,
    this.widthFactor,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If widthFactor is provided, wrap in FractionallySizedBox
    Widget textField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        TextFormField(
          initialValue: initialValue,
          readOnly: readOnly,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: maxLines > 1 ? 15 : 12, // More padding for multi-line
              horizontal: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: primaryBlue, width: 2),
            ),
            suffixIcon: suffixWidget,
          ),
          onTap: () {
            // Logic for opening time picker or date picker if needed
          },
        ),
        const SizedBox(height: 20),
      ],
    );

    if (widthFactor != null) {
      return Expanded(child: textField);
    }
    return textField;
  }
}
