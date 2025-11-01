
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customTextfield extends StatelessWidget {
  String label;
  TextEditingController? controller;
  String? Function(String?)? validator;
  customTextfield({super.key, required this.label,required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Color(0xffFFFFFF),
        labelText: label,
        labelStyle: TextStyle(color: Color(0xff0054A5)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff0054A5), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}