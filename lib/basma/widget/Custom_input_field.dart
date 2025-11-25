
// --- 2. CustomInputField (لحقول الإدخال في شاشة Edit Profile) ---
import 'package:fixit/basma/screens/main_profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String initialValue;
  final bool readOnly;
  final Widget? suffixIcon;
  final bool isDate;
  final Widget? prefixWidget;
  final TextInputType keyboardType;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.initialValue,
    this.readOnly = false,
    this.suffixIcon,
    this.isDate = false,
    this.prefixWidget,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
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
            suffixIcon: suffixIcon,
            prefixIcon: prefixWidget,
          ),
          onTap: isDate
              ? () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime(2006, 11, 28),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                }
              : null,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

