import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title:  Text(
        lang.my_profile,
        style: TextStyle(
          color: Color(0xFF0054A5), 
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: const SizedBox(),
      actions: [_buildActionButton()],
    );
  }

  Widget _buildActionButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 24,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF5F5F5),
        ),
      ),
    );
  }
}