// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
//
// class LanguageCubit extends Cubit<Locale> {
//   LanguageCubit() : super(const Locale('en'));
//
//   void toggleLanguage() {
//     if (state.languageCode == 'en') {
//       emit(const Locale('ar'));
//     } else {
//       emit(const Locale('en'));
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fixit/gitHub/core/stores/app_box.dart';


class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en', 'US')) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final savedLang = AppBox.box.get('lang', defaultValue: 'en') as String;
    emit(Locale(savedLang, savedLang == 'ar' ? 'AE' : 'US'));
  }

  Future<void> toggleLanguage() async {
    final current = state.languageCode;
    final newLang = current == 'en' ? 'ar' : 'en';

    await AppBox.box.put('lang', newLang);
    emit(Locale(newLang, newLang == 'ar' ? 'AE' : 'US'));
  }
}

