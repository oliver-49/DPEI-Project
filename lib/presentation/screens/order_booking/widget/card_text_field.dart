import 'package:flutter/material.dart';

class CardTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Function(String)? onChanged;

  const CardTextField({
    super.key,
    required this.label,
    required this.hint,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13,
          color: Color(0xff565656),
        ),
        hintStyle: const TextStyle(color: Color(0xffA5A5A5)),
        contentPadding: EdgeInsets.symmetric(
          horizontal: w * 0.04,
          vertical: w * 0.035,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffE0E0E0)),
        ),
      ),
    );
  }
}
