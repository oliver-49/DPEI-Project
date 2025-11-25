import 'package:flutter/material.dart';

Widget baseCard(BuildContext context, {required Widget child}) {
  final w = MediaQuery.of(context).size.width;

  return Container(
    padding: EdgeInsets.all(w * 0.04),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color(0xffE0E0E0)),
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.grey.withOpacity(0.08),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: child,
  );
}

Widget buildHeader(BuildContext context, String serviceName) {
  return Row(
    children: [
      const Icon(Icons.plumbing_outlined, color: Color(0xff0054A5)),
      const SizedBox(width: 6),
      Text(
        serviceName,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          color: Color(0xff565656),
        ),
      ),
    ],
  );
}

Widget infoRow(
  BuildContext context,
  String label,
  String value, {
  Color valueColor = Colors.black,
  bool link = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xff565656),
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: link ? const Color(0xff0054A5) : valueColor,
              decoration: link ? TextDecoration.underline : null,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    ),
  );
}

String formatDate(BuildContext context, DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}
