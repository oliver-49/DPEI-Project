import 'package:fixit/basma/basma.dart';
import 'package:fixit/esraa/screens/profile_screen.dart';
import 'package:fixit/esraa/utils/app_routes.dart';
import 'package:fixit/gitHub/booking_services/cubit/booking_cubit.dart';
import 'package:fixit/gitHub/core/services/firebase_options.dart';
import 'package:fixit/gitHub/core/stores/app_box.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Selction_view/selection_who_screen.dart';
import 'package:fixit/l10n/cubit/lang_cubit.dart';
import 'package:fixit/ye/navigation_page.dart';
import 'package:fixit/yreyhan/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Selction_view/selection_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBox.init();
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( 
    MultiBlocProvider(
  providers: [
    BlocProvider(
        create: (context) => BookingCubit(),
    ),
    BlocProvider(
        create: (context) => SelectionCubit(),
      ),
      BlocProvider(
        create: (context) => LanguageCubit(),
      ),
  ],
  child: MyApp(),
));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
            SplashScreen(),//yossef reyhan
            
            // initialRoute: AppRoutes.mainNavigation,//esraa
            // routes: AppRoutes.routes,
            // AppRoutes.mainNavigation,//esraa
      
      
      
      
        // BlocProvider(
        //   create: (context) => SelectionCubit(),
        //   child: const AccountSetup(),
        // ),
      ); 
      },
    );
  }
}


