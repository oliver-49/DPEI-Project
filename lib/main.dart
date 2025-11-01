import 'package:fixit/l10n/app_localizations.dart';
import 'package:fixit/presentation/screens/account_service/Selction_view/selection_cubit.dart';
import 'package:fixit/presentation/screens/account_service/Selction_view/selection_who_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("ar"),

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const <Locale>[Locale('en', 'US'), Locale('ar', 'AE')],

      debugShowCheckedModeBanner: false,

      home: BlocProvider(
        create: (context) => SelectionCubit(),
        child: const AccountSetup(),
      ),
    );
  }
}
