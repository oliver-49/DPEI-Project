// FILE: lib/utils/app_routes.dart
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/add_new_card_screen.dart';
import '../screens/help_support_screen.dart';
import '../screens/profile_page.dart';
import '../screens/main_navigation_screen.dart';

class AppRoutes {
  // Main navigation
  static const String mainNavigation = '/';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String notification = '/notification';
  static const String payment = '/payment';
  static const String addNewCard = '/add-new-card';
  static const String helpSupport = '/help-support';
  static const String profilePage = '/profile-page';

  // Get all routes
  static Map<String, WidgetBuilder> get routes {
    return {
      mainNavigation: (context) => const MainNavigationScreen(),
      profile: (context) => const ProfileScreen2(),
      editProfile: (context) => const EditProfileScreen(),
      notification: (context) => const NotificationScreen(),
      payment: (context) => const PaymentScreen(),
      addNewCard: (context) => const AddNewCardScreen(),
      helpSupport: (context) => const HelpSupportScreen(),
      profilePage: (context) =>  ProfilePage(),
    };
  }

  // Helper method for navigation
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // Replace current screen (no back button)
  static void replaceWith(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}