import 'package:fixit/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SellingModeButton extends StatelessWidget {
  const SellingModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        children: [
        
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              'assets/icons/change_icon.png', 
              width: 24,
              height: 24,
            ),
          ),
          
          Text(
            lang.change_to_selling_mode,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}