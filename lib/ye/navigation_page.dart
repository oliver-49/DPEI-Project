// import 'package:dpei_project/home_screen.dart';
// import 'package:dpei_project/utalities/colors.dart';
// import 'package:flutter/material.dart';

// class NavigationPage extends StatefulWidget {
//     NavigationPage({super.key});

//   @override
//   State<NavigationPage> createState() => _NavigationPageState();
// }


// class _NavigationPageState extends State<NavigationPage> {
//     int index=0;
//   final List pages=[

//     HomeScreen(),
//     // HomeScreen(),
//     // HomeScreen(),
//     // HomeScreen(),
//     // Center(child: Text("data"),),
//     Center(child: Text("datya"),),
//     Center(child: Text("datyya"),),
//     Center(child: Text("datayyyyyyy"),),

//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // extendBody: true,
//       backgroundColor: Colors.white,
//       body: pages[index],
      
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.transparent,
//           elevation: 0, 
//         currentIndex: index,
//         selectedItemColor: AppColors.mainColor ,
//         unselectedItemColor: AppColors.secoundryColor,
        
//         onTap: (value) => setState(() {
//           index=value;
//         }),
        
//         items: const  [
//             BottomNavigationBarItem(
//               icon:Icon(Icons.home_outlined),
//               activeIcon:Icon(Icons.home),
//               label: "Home"
//               ),
//                 BottomNavigationBarItem(
//               icon:Icon(Icons.holiday_village_outlined),
//               activeIcon: Icon(Icons.holiday_village),
//               label: "City"
//               ),
//                 BottomNavigationBarItem(
//               icon:Icon(Icons.shopping_bag_outlined),
//               activeIcon: Icon(Icons.shopping_bag),
//               label: "Order"
//               ),
//                 BottomNavigationBarItem(
//               icon:Icon(Icons.account_circle_outlined),
//               activeIcon: Icon(Icons.account_circle),
//               label: "Profile"
//               ),
              
//         ],
        
      
      
//       ),
//     );
//   }
// }

import 'package:fixit/basma/basma.dart';
import 'package:fixit/gitHub/city_page.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/home_screen.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  
  final ServiceProviderModel provider;
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
      _NavigatorTab(child: HomeScreen()),
      const _NavigatorTab(child: Center(child: Text("City Page"))),
      _NavigatorTab(child: ProfileScreen(provider: widget.provider)),
    ];
  }

  

  @override
  Widget build(BuildContext context) {
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
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.holiday_village_outlined),
          //     activeIcon: Icon(Icons.holiday_village),
          //     label: "City"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag),
              label: "Order"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle),
              label: "Profile"),
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
