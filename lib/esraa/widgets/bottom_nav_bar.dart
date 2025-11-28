import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, lang.home, isActive: false),
          _buildNavItem(Icons.location_city, lang.city, isActive: false),
          _buildNavItem(Icons.shopping_bag, lang.orders, isActive: false),
          _buildNavItem(Icons.person, lang.profile, isActive: true),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF0054A5) : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? const Color(0xFF0054A5) : Colors.grey,
          ),
        ),
      ],
    );
  }
}