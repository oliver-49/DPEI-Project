import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/l10n/cubit/lang_cubit.dart';
import 'package:fixit/yreyhan/auth/login_screen.dart';
import 'package:fixit/yreyhan/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0054A5), Color(0xFF00152A)],
                transform: GradientRotation(134.21 * 3.1416 / 180),
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() => isLastPage = index == 2);
                    },
                    children: [
                      buildOnboardPage(
                        image: '${imagePath}worker1.png',
                        title: 'Welcome to FixIt',
                        subtitle:
                            'Discover a world of convenience and reliability. FixIt is your one stop solution for all your home service needs.',
                      ),
                      buildOnboardPage(
                        image: '${imagePath}worker2.png',
                        title: 'Find Services',
                        subtitle:
                            'Browse and book a wide range of services from plumbing and electrical to appliance repair. We’ve got it all covered.',
                      ),
                      buildOnboardPage(
                        image: '${imagePath}worker3.png',
                        title: 'Fast & Reliable',
                        subtitle:
                            'Our professionals ensure quick and reliable service every time. Sit back and relax, we’ve got you covered.',
                      ),
                    ],
                  ),

                  // Skip
                  Positioned(
                    top: 16,
                    right: 16,
                    child: TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),

                  // Page indicator
                  Positioned(
                    top: 24,
                    left: 16,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.white,
                        dotColor: Colors.white54,
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 6,
                      ),
                    ),
                  ),

                  // Next / Get Started button
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            if (isLastPage) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            } else {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0054A5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            isLastPage ? 'Get Started' : 'Next',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          context.read<LanguageCubit>().toggleLanguage();
                        },
                        child: Container(
                          child: Text(
                            context.watch<LanguageCubit>().state.languageCode ==
                                    'en'
                                ? "Change Language"
                                : "تغير اللغة ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 0,
                    child: Center(
                      child: Builder(
                        builder: (context) {
                          return Text(
                            AppLocalizations.of(context)!.nextButton,
                            style: const TextStyle(color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildOnboardPage({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // الصورة طالعة من الكارد
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(19.5),
                ),
              ),
              Positioned(
                top: -40, // الصورة طالعة برا الكارت شوية لفوق
                child: Image.asset(image, height: 280, fit: BoxFit.contain),
              ),
            ],
          ),

          const SizedBox(height: 70),

          // العنوان
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          // النص التوضيحي
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
