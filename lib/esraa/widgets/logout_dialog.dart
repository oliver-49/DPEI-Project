// lib/widgets/logout_dialog.dart
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    return AlertDialog(
      title:  Text(
        lang.logout,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content:  Text(
        lang.logout_confirmation,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child:  Text(
            lang.cancel,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6C63FF),
          ),
          onPressed: () {
            // Add your logout logic here
            Navigator.of(context).pop();
            // Navigate to login screen or clear user data
          },
          child:  Text(
            lang.logout,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}