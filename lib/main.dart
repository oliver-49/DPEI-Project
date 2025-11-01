import 'package:flutter/material.dart';
import 'screens/main_navigation_screen.dart';
import 'utils/app_routes.dart';

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
      initialRoute: AppRoutes.mainNavigation,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}