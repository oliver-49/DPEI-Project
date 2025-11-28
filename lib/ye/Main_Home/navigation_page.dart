import 'package:fixit/basma/screens/main_profile_screen/profile_screen.dart';
import 'package:fixit/esraa/screens/profile_page.dart';
import 'package:fixit/gitHub/city_page.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/order/presentation/screens/order_booking/order/order_view.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/Main_Home/home_screen.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {

  final ServiceProviderModel? provider;
  const NavigationPage({super.key, required this.provider});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int index = 0;

late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      _NavigatorTab(child: HomeScreen(provider:widget.provider)),
      // const _NavigatorTab(child: Center(child: Text("City Page"))),
      _NavigatorTab(child:  OrdersView(
        // provider: widget.provider
      )),

    widget.provider!.role=='customer'?
      _NavigatorTab(child:  ProfileScreen(provider: widget.provider))
      :
      _NavigatorTab(child: ProfileScreen(provider: widget.provider)),
    ];
  }



  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: IndexedStack(
        index: index,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: index,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.secoundryColor,
        onTap: (value) => setState(() {
          index = value;
        }),
        items:  [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: lang.home),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.holiday_village_outlined),
          //     activeIcon: Icon(Icons.holiday_village),
          //     label: "City"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag),
              label: lang.orders),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle),
              label: lang.profile),
        ],
      ),
    );
  }
}

/// Helper widget that provides its own Navigator
class _NavigatorTab extends StatelessWidget {
  final Widget child;
  const _NavigatorTab({required this.child});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (_) => child,
        );
      },
    );
  }
}
