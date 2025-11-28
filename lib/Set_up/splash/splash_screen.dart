import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit/firebase/auth_service.dart';
import 'package:fixit/firebase/getORadd_allData_user.dart';
import 'package:fixit/gitHub/core/stores/app_box.dart';
import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/l10n/cubit/lang_cubit.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/Main_Home/home_screen.dart';
import 'package:fixit/ye/Main_Home/navigation_page.dart';
import 'package:fixit/Set_up/const.dart';
import 'package:fixit/Set_up/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fixit/Set_up/auth/login_screen.dart';

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
                        builder: (context) =>   AuthWrapper(),
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

class AuthWrapper extends StatelessWidget {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var lang=AppLocalizations.of(context)!;

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 1️⃣ لسه بيحمّل حالة الدخول
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        // 2️⃣ لو مفيش User → Login
        if (!snapshot.hasData) {
          return LoginScreen();
        }

        // 3️⃣ فيه User → نجيب UID
        String uid = snapshot.data!.uid;
        final service = ServiceProviderService();

        // 4️⃣ نجيب بيانات الـ provider من Firestore
        return FutureBuilder<ServiceProviderModel>(
          future: service.getServiceProvider(uid),
          builder: (context, providerSnapshot) {
            if (providerSnapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }

            if (providerSnapshot.hasError) {
              return Scaffold(
                body: Center(child: Text(lang.error_loading)),
              );
            }

            final provider = providerSnapshot.data!;
            return NavigationPage(provider: provider);
          },
        );
      },
    );
  }
}
