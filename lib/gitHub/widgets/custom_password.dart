import 'package:flutter/material.dart';

class CustomPassword extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;

  const CustomPassword({
    super.key,
    required this.controller,
    this.hintText ,
    this.prefixIcon = Icons.lock_outline,
    this.validator,
  });

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon, color: const Color(0xff2B54A4)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: const Color(0xff2B54A4),
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff2B54A4), width: 1.3),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff2B54A4), width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      ),
    );
  }
}
