import 'package:flutter/material.dart'; 
import 'screens/profile_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/add_new_card_screen.dart';
import 'screens/help_support_screen.dart';
import 'screens/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEPI Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ProfileScreen(),
      // home: const EditProfileScreen(),
      // home: const NotificationScreen(), // ← غيرت لـ const
      // home: const PaymentScreen(),
      // home: const AddNewCardScreen(),
      // home: const HelpSupportScreen(),
      // home: const ProfilePage(),
       
      debugShowCheckedModeBanner: false,
      routes: {
        '/help-support': (context) => const HelpSupportScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/add-new-card': (context) => const AddNewCardScreen(),
        '/profile-page': (context) => const ProfilePage(),
      },
    );
  }
}