import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PhoneNumberState {
  final Color borderColor;
  final String countryCode;
  final String phone;

  PhoneNumberState({
    this.borderColor = const Color(0xffCACACA),
    this.countryCode = '+20',
    this.phone = '',
  });

  PhoneNumberState copyWith({
    Color? borderColor,
    String? countryCode,
    String? phone,
  }) {
    return PhoneNumberState(
      borderColor: borderColor ?? this.borderColor,
      countryCode: countryCode ?? this.countryCode,
      phone: phone ?? this.phone,
    );
  }
}

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  PhoneNumberCubit() : super(PhoneNumberState());

  String? validatePhone() {
    final p = state.phone.trim();

    if (p.isEmpty) {
      return 'من فضلك أدخل رقم الهاتف';
    }
    if (p.length != 10) {
      return 'رقم الهاتف يجب أن يكون 10 أرقام';
    }


    const allowedPrefixes = ['10', '11', '12', '15'];
    final hasValidPrefix = allowedPrefixes.any((pre) => p.startsWith(pre));

    if (!hasValidPrefix) {
      return 'رقم المحمول يجب أن يبدأ بـ 10 أو 11 أو 12 أو 15';
    }

    final isAllDigits = RegExp(r'^\d{10}$').hasMatch(p);
    if (!isAllDigits) {
      return 'رقم الهاتف يجب أن يحتوي على 10 أرقام فقط';
    }

    return null;
  }

  void changeBorder(Color color) => emit(state.copyWith(borderColor: color));
  void setCountryCode(String code) => emit(state.copyWith(countryCode: code));
  void setPhone(String phone) => emit(state.copyWith(phone: phone));
}
