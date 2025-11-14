<<<<<<< Updated upstream
=======
// import 'package:fixit/ye/navigation_page.dart';
// import 'package:fixit/ye/utalities/Services/logic/service_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

//   List<Map<String, List<Map<String, String>>>> servicesCard = [
//     {
//       "Maintenance": [
//         {"img": "assets/images/Air Conditenior.png", "job": "Air Condition"},
//         {"img": "assets/images/Multimeter.png", "job": "Electric"},
//         {"img": "assets/images/image 100.png", "job": "Siding repair"},
//         {"img": "assets/images/Car Wash.png", "job": "Car Wash"},
//       ],
//     },
//     {
//       "Cleaning": [
//         {"img": "assets/images/Spin Mop.png", "job": "Home Flooring"},
//         {"img": "assets/images/image 101.png", "job": "Gutter"},
//         {"img": "assets/images/Frame 1000003290.png", "job": "Carpet"},
//         {"img": "assets/images/Pliers.png", "job": "Pliers"},
//       ],
//     },
//     {
//       "Home improvement": [
//         {"img": "assets/images/image 109.png", "job": "Drilling"},
//         {"img": "assets/images/image 102.png", "job": "lawn "},
//         {"img": "assets/images/image 103.png", "job": "Weed control"},
//         {"img": "assets/images/Water Tap.png", "job": "Water Tap"},
//       ],
//     },
//     {
//       "Security": [
//         {"img": "assets/images/CCTV (1).png", "job": "Cameras"},
//         {"img": "assets/images/image 104 (1).png", "job": "Burglar alarm"},
//         {"img": "assets/images/image 105 (1).png", "job": "Sturdy lock"},
//         {"img": "assets/images/Cctv (2).png", "job": "Cctv"},
//       ],
//     },
//     {
//       "Car Maintenance": [
//         {"img": "assets/images/Car Waxing.png", "job": "Car washer"},
//         {"img": "assets/images/image 109 (1).png", "job": "Oil change"},
//         {"img": "assets/images/image 110.png", "job": "Car battery"},
//         {"img": "assets/images/Car Wash.png", "job": "Car Waxing"},
//       ],
//     },
//     {
//       "Handyman Services": [
//         {"img": "assets/images/image 108 (1).png", "job": "Furniture"},
//         {"img": "assets/images/image 111.png", "job": "Door"},
//         {"img": "assets/images/image 112.png", "job": "Shelving "},
//         {
//           "img":
//               "assets/images/Painter holding paint roller and paint bucket.png",
//           "job": "Painting",
//         },
//       ],
//     },
//     {
//       "Other services": [
//         {"img": "assets/images/image 113.png", "job": "Interior"},
//         {"img": "assets/images/image 114.png", "job": "Exterior"},
//         {"img": "assets/images/image 115.png", "job": "Wall "},
//         {"img": "assets/images/image 116.png", "job": "Dish wash  "},
//         {"img": "assets/images/image 117 (1).png", "job": "Loading"},
//         {"img": "assets/images/image 118.png", "job": "Cutting"},
//         {
//           "img": "assets/images/Boy mopping the floor.png",
//           "job": "Mopping Floor",
//         },
//       ],
//     },
//   ];

// void main() {
//   runApp(
//       // BlocProvider(
//       //   create: (context) => ServiceCubit()..getServices(
//       // servicesCard[0].values.first,),
//       //   child: MyApp())
//           MyApp()
//         );
// }

// class MyApp extends StatelessWidget {
//     MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NavigationPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }



// aya 
import 'package:fixit/basma/basma.dart';
import 'package:fixit/esraa/screens/profile_screen.dart';
import 'package:fixit/esraa/utils/app_routes.dart';
import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/booking_services/view/providerprofile.dart';
import 'package:fixit/gitHub/core/services/firebase_options.dart';
import 'package:fixit/gitHub/core/stores/app_box.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Selction_view/selection_who_screen.dart';
import 'package:fixit/l10n/cubit/lang_cubit.dart';
import 'package:fixit/ye/navigation_page.dart';
import 'package:fixit/yreyhan/splash/splash_screen.dart';
import 'package:flutter/material.dart';
>>>>>>> Stashed changes
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:fixit/booking_services/cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fixit/account_setup_service_seeker/view/verification_method.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'booking_services/view/providerprofile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favoritesBox');
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          BlocProvider(create: (context) => BookingCubit(), child: MyApp()),
    ),
<<<<<<< Updated upstream
  );
=======
    BlocProvider(
        create: (context) => SelectionCubit(),
      ),
      BlocProvider(
        create: (context) => LanguageCubit(),
      ),
  ],
  child: MyApp(),
));
>>>>>>> Stashed changes
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xfff9f9f9)),
      home: ProviderProfile(),
=======
    return BlocBuilder<LanguageCubit,Locale>(
      builder: (context, state) {
        
     
      return GetMaterialApp (
        locale: state ,//const Locale("en"),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      
        supportedLocales: const <Locale>[Locale('en', 'US'), Locale('ar', 'AE')],
      
        debugShowCheckedModeBanner: false,
      
        home: 
        // ProfileScreen2()//esraa
       
            // NavigationPage(),// yElgammal
            // AccountSetup(),// aya
            //SplashScreen(),//yossef reyhan
            ProviderProfile(),
            // initialRoute: AppRoutes.mainNavigation,//esraa
            // routes: AppRoutes.routes,
            // AppRoutes.mainNavigation,//esraa
      
      
      
      
        // BlocProvider(
        //   create: (context) => SelectionCubit(),
        //   child: const AccountSetup(),
        // ),
      ); 
      },
>>>>>>> Stashed changes
    );
  }
}