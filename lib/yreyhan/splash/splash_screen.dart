import 'dart:async';
import 'package:fixit/gitHub/core/stores/app_box.dart';
import 'package:fixit/l10n/cubit/lang_cubit.dart';
import 'package:fixit/ye/home_screen.dart';
import 'package:fixit/ye/navigation_page.dart';
import 'package:fixit/yreyhan/const.dart';
import 'package:fixit/yreyhan/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fixit/yreyhan/splash/splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      if (AppBox.isSetupDone()) {
        
        
         Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>   NavigationPage(),
                      ),
                    );
      // Future.microtask(() {
      //    Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) =>  HomeScreen(),
      //                 ),
      //               );

        // Navigator.pushAndRemoveUntil(
        //   // ignore: use_build_context_synchronously
        //   context,
        //   MaterialPageRoute(builder: (_) =>  HomeScreen()),
        //   (route) => false,
        // );

      // });
     
    }
    else{
     Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => BlocProvider.value(
      value: context.read<LanguageCubit>(),
      child: const OnboardingScreen(),
    ),
  ),
);}

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF016ED7), Color(0xFFFFFFFF)],
            stops: [0.0276, 1.1251],
            transform: GradientRotation(121.12 * 3.1416 / 180),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath + "Frame.svg",
            width: 127,
            height: 106,
          ),
        ),
      ),
    );
  }
}
