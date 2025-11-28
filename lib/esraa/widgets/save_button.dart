import 'package:fixit/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

// This widget for save button in edit profile screen
class SaveButton extends StatelessWidget {
  final VoidCallback onPressed; // دالة التنفيذ عند الضغط - Function to execute when pressed
  
  const SaveButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onPressed, // Execute function when tapped
      child: Container(
        width: double.infinity, // Full width
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF0054A5), 
          borderRadius: BorderRadius.circular(12), // زوايا دائرية - Rounded corners
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0054A5).withOpacity(0.3), 
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child:  Center(
          child: Text(
            lang.save, //  Button text
            style: TextStyle(
              color: Colors.white, 
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}