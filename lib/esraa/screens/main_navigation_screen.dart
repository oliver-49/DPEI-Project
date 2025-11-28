import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'profile_screen.dart';
import 'profile_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(lang.home), backgroundColor: Colors.white),
      body: Center(
        child: Text(lang.home_screen, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class CityScreen extends StatelessWidget {
  const CityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(lang.city), backgroundColor: Colors.white),
      body: Center(
        child: Text(lang.city_screen, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:  Text(lang.orders), backgroundColor: Colors.white),
      body:  Center(
        child: Text(lang.order_screen, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CityScreen(),
    const OrderScreen(),
    const ProfileScreen2(),
  ];

  @override
  Widget build(BuildContext context) {
    var lang =AppLocalizations.of(context)!;

    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0054A5),
        unselectedItemColor: Colors.grey,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: lang.home),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: lang.city,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: lang.orders,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: lang.profile),
        ],
      ),
    );
  }
}
