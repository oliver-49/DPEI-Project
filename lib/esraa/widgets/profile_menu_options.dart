import 'package:fixit/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'profile_menu_item.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/help_support_screen.dart';

class ProfileMenuOptions extends StatelessWidget {
  const ProfileMenuOptions({super.key});

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;
    return Column(
      children: [
        ProfileMenuItem(
          title: lang.edit_profile,
          iconPath: 'assets/icons/edit_profile_icon.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditProfileScreen()),
            );
          },
        ),
        const SizedBox(height: 8),
        
        ProfileMenuItem(
          title: lang.notification,
          iconPath: 'assets/icons/notification_icon.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationScreen()),
            );
          },
        ),
        const SizedBox(height: 8),
        
        ProfileMenuItem(
          title: lang.payment_method,
          iconPath: 'assets/icons/payment_icon.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentScreen()),
            );
          },
        ),
        const SizedBox(height: 8),
        
        ProfileMenuItem(
          title: lang.help_support,
          iconPath: 'assets/icons/help_icon.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpSupportScreen()),
            );
          },
        ),
        const SizedBox(height: 8),
        
        ProfileMenuItem(
          title: lang.logout,
          iconPath: 'assets/icons/logout_icon.png', 
          isLogout: true,
          onTap: () {
            _showLogoutDialog(context);
          },
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    var lang =AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/final_logout_pic.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
               Text(
                lang.logout,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
               Text(
                lang.logout_confirmation,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0054A5),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:  Text(
                        lang.logout,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child:  Text(
                        lang.cancel,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}