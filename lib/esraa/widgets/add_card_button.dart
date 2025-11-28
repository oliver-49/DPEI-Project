// FILE: lib/widgets/add_card_button.dart
// Custom button for adding new card with blue border

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class AddCardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCardButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF0062DC), // Blue border
          width: 2,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF0062DC), // Blue plus sign
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Color(0xFF0062DC), // Blue plus sign
            size: 16,
          ),
        ),
        title:  Text(
          lang.add_new_card,
          style: TextStyle(
            color: Color(0xFF0062DC), // Blue text
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}