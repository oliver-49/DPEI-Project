import 'package:dpei_project/generated/l10n.dart';
import 'package:dpei_project/presentation/screens/account_service/selectionview/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dpei_project/presentation/screens/account_service/selectionview/selection_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SelectionCubit(),
        child: const AccountSetup(),
      ),
    );
  }
}